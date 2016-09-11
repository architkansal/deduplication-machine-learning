from django.conf import settings
from django.shortcuts import render, render_to_response, redirect
from django.http import HttpResponse, HttpResponseRedirect, HttpRequest, Http404,JsonResponse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required,user_passes_test
from django.contrib.auth.models import User
from django.db.models import Count, Min, Sum, Avg
from django.template import RequestContext
from django.shortcuts import render_to_response
from django.template import RequestContext
import os.path
import sys
import re
import csv
from django.core.files.base import ContentFile
import json
from future.builtins import next
import os
import csv
import re
import logging
import optparse
import dedupe
from unidecode import unidecode



data = {}
data['Site name'] = 'String'
data['Address']='String'
data['Zip']='Exact'
data['Phone']='String'

uploaded_filename=''
full_filename=''

uncertain_pairs = {}
labels = {'distinct' : [], 'match' : []}
fields = []
flgg=1
yc=0
nc=0
uc=0

input_file = 'tmp_dir2/input.csv'
output_file = 'tmp_dir2/output.csv'
settings_file = 'tmp_dir2/learned_settings'
training_file = 'tmp_dir2/training.json'


data_d = None
deduper = None
record_pair = None

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")


def home(request):
	return render(request,'home.html')

def attrib(request):
	uploaded_filename = open('tmp_dir2/sample.csv')
	reader = csv.reader(uploaded_filename)
	x = next(reader)
	total=[1,2,3,4,5,6,7,8,9,10]
	return render(request,'dropdown.html',{'data':x,'total':total})

def get_data(request):
	return render(request, 'home.html', RequestContext(request, locals())) 


def m(request):
	print request.FILES['csv_file']
	folder = 'tmp_dir2/' #request.path.replace("/", "_")
	uploaded_filename = request.FILES['csv_file'].name
	BASE_PATH = 'C:/Users/VinayG/Desktop/mindml/deduplication-machine-learning/ml_dedupe'
	# create the folder if it doesn't exist.
	try:
		os.mkdir(os.path.join(BASE_PATH, folder))
	except:
		pass

	# save the uploaded file inside that folder.
	full_filename = os.path.join(BASE_PATH, folder, uploaded_filename)
	fout = open(full_filename, 'wb+')
	file_content = ContentFile( request.FILES['csv_file'].read() )

	# try:
	# Iterate through the chunks.
	for chunk in file_content.chunks():
		fout.write(chunk)
	fout.close()
	s_ur = do_dedupe(request)
	html = "<html><body>SAVED</body></html>"
	print "Hela"
	print s_ur
	ke=[]
	val=[]
	for key in sorted(s_ur.keys()):
		ke.append(key)
		val.append(s_ur[key])
		print "%s: %s" % (key, s_ur[key])
	return render(request,'training.html',{'key':ke,'val':val})
	# except:
	# 	html = "<html><body>NOT SAVED</body></html>"
	# 	return HttpResponse(html)




# def run_dedupe():
# 	B_P = '/home//archit/django-user/deduplication-machine-learning/ml_dedupe/tmp_dir2/csv_example.py'
# 	execfile(B_P);
# 	return 1;




def do_dedupe(request):
	optp = optparse.OptionParser()
	optp.add_option('-v', '--verbose', dest='verbose', action='count',
					help='Increase verbosity (specify multiple times for more)'
					)
	(opts, args) = optp.parse_args()
	log_level = logging.WARNING 
	if opts.verbose:
		if opts.verbose == 1:
			log_level = logging.INFO
		elif opts.verbose >= 2:
			log_level = logging.DEBUG
	logging.getLogger().setLevel(log_level)
	# ## Setup

	input_file = 'tmp_dir2/input.csv'
	output_file = 'csv_example_output.csv'
	settings_file = 'csv_example_learned_settings'
	training_file = 'csv_example_training.json'

	print('importing data ...')
	global data_d
	data_d = readData(input_file)
	global deduper
	# If a settings file already exists, we'll just load that and skip training
	if os.path.exists(settings_file):
		print('reading from', settings_file)
		with open(settings_file, 'rb') as f:
			deduper = dedupe.StaticDedupe(f)
	else:    # ## Training

	# Define the fields dedupe will pay attention to
		# global fields
		fields=[]
		for key,val in data.iteritems():
			fields += [
				{'field' : key, 'type': val },
				]
		print fields
	# Create a new deduper object and pass our data model to it.
		deduper = dedupe.Dedupe(fields)

	# To train dedupe, we feed it a sample of records.
		deduper.sample(data_d, 15000)

	# If we have training data saved from a previous run of dedupe,
	# look for it and load it in.
	# __Note:__ if you want to train from scratch, delete the training_file
		if os.path.exists(training_file):
			print('reading labeled examples from ', training_file)
			with open(training_file, 'rb') as f:
				deduper.readTraining(f)

	# ## Active learning
	# Dedupe will find the next pair of records
	# it is least certain about and ask you to label them as duplicates
	# or not.
	# use 'y', 'n' and 'u' keys to flag duplicates
	# press 'f' when you are finished
		print('starting active labeling...')
		# return render(request,'training.html')
		s_usr = console_own(deduper,request)
		return s_usr


def cluster_data(request):
	# Using the examples we just labeled, train the deduper and learn
	# blocking predicates
	print 'hitting....................'
	global data_d
	global deduper
	deduper.train()

	# When finished, save our training to disk
	with open(training_file, 'w') as tf:
		deduper.writeTraining(tf)

	# Save our weights and predicates to disk.  If the settings file
	# exists, we will skip all the training and learning next time we run
	# this file.
	with open(settings_file, 'wb') as sf:
		deduper.writeSettings(sf)

	# Find the threshold that will maximize a weighted average of our
	# precision and recall.  When we set the recall weight to 2, we are
	# saying we care twice as much about recall as we do precision.
	#
	# If we had more data, we would not pass in all the blocked data into
	# this function but a representative sample.

	threshold = deduper.threshold(data_d, recall_weight=1)

	# ## Clustering

	# `match` will return sets of record IDs that dedupe
	# believes are all referring to the same entity.

	print('clustering...')
	clustered_dupes = deduper.match(data_d, threshold)

	print('# duplicate sets', len(clustered_dupes))

	# ## Writing Results

	# Write our original data back out to a CSV with a new column called 
	# 'Cluster ID' which indicates which records refer to each other.

	cluster_membership = {}
	cluster_id = 0
	for (cluster_id, cluster) in enumerate(clustered_dupes):
		id_set, scores = cluster
		cluster_d = [data_d[c] for c in id_set]
		canonical_rep = dedupe.canonicalize(cluster_d)
		for record_id, score in zip(id_set, scores):
			cluster_membership[record_id] = {
				"cluster id" : cluster_id,
				"canonical representation" : canonical_rep,
				"confidence": score
			}

	singleton_id = cluster_id + 1

	with open(output_file, 'w') as f_output, open(input_file) as f_input:
		writer = csv.writer(f_output)
		reader = csv.reader(f_input)

		heading_row = next(reader)
		heading_row.insert(0, 'confidence_score')
		heading_row.insert(0, 'Cluster ID')
		canonical_keys = canonical_rep.keys()
		for key in canonical_keys:
			heading_row.append('canonical_' + key)

		writer.writerow(heading_row)

		for row in reader:
			row_id = int(row[0])
			if row_id in cluster_membership:
				cluster_id = cluster_membership[row_id]["cluster id"]
				canonical_rep = cluster_membership[row_id]["canonical representation"]
				row.insert(0, cluster_membership[row_id]['confidence'])
				row.insert(0, cluster_id)
				for key in canonical_keys:
					row.append(canonical_rep[key].encode('utf8'))
			else:
				row.insert(0, None)
				row.insert(0, singleton_id)
				singleton_id += 1
				for key in canonical_keys:
					row.append(None)
			writer.writerow(row)
	return HttpResponse("<h1>BC</h1>")



def preProcess(column):
	# print 'preprocessing...'
	try : # python 2/3 string differences
		column = column.decode('utf8')
	except AttributeError:
		pass
	column = unidecode(column)
	column = re.sub('  +', ' ', column)
	column = re.sub('\n', ' ', column)
	column = column.strip().strip('"').strip("'").lower().strip()
	# If data is missing, indicate that by setting the value to `None`
	if not column:
		column = None
	# print 'preprocessed...'
	return column

def readData(filename):
	print 'Reading Data...'
	print filename
	data_d = {}
	# try:
	# 	open('tmp_dir2/input.csv')
	# 	print 'success...'
	# except:
	# 	print 'error'
	# 	pass
	with open('tmp_dir2/input.csv') as f:
		print f
		# print '1...'
		reader = csv.DictReader(f)
		for row in reader:
			# print '2...'
			clean_row = [(k, preProcess(v)) for (k, v) in row.items()]
			row_id = int(row['Id'])
			data_d[row_id] = dict(clean_row)
		print 'Reading Successful...'
	return data_d



def got_it(request):
	attr="attr"
	comp="comp"
	for x in range(1,10):
		comp+=str(x)
		attr+=str(x)
		if request.POST[comp] != 'None':
			data[request.POST[attr]]=request.POST[comp]
		comp = 'comp'
		attr = 'attr'	
	print data
	html = "<html><body>NOT SAVED</body></html>"
	return HttpResponse(html)



record_pair = {}


def console_own(deduper,request):
	# print 'yep...'
	finished = False
	global fields
	fields = unique(field.field
					for field
					in deduper.data_model.primary_fields)

	# print 'here...'
	# while not finished :
	n_match, n_distinct = (len(deduper.training_pairs['match']),
							len(deduper.training_pairs['distinct']))

	uncertain_pairs = deduper.uncertainPairs() 

	labels = {'distinct' : [], 'match' : []}

	send_user={}
	global record_pair
	for record_pair in uncertain_pairs:
		label = ''
		labeled = False
		ct=1
		for pair in record_pair:
			for field in fields:
				send_user[str(ct)+'_'+field]=pair[field]
			ct+=1

	send_user['positive']=n_match
	send_user['negative']=n_distinct
	print("{0}/10 positive, {1}/10 negative".format(n_match, n_distinct))
	# print send_user
	return send_user



def unique(seq):
    seen = set()
    seen_add = seen.add
    return [x for x in seq if not (x in seen or seen_add(x))]





def assign_label(request):
	print request.POST
	uncertain_pairs = deduper.uncertainPairs()
	# return  HttpResponse(request.POST['data'])
	label=request.POST['data']
	if label == 'y' :
		labels['match'].append(record_pair)
		labeled = True
	elif label == 'n' :
		labels['distinct'].append(record_pair)
		labeled = True
	elif label == 'f':
		# print('Finished labeling', file=sys.stderr)
		finished = True
	elif label != 'u':
		# print('Nonvalid response', file=sys.stderr)
		raise
	print labels
	print label
	if labeled:
		deduper.markPairs(labels)
	return HttpResponse("Done...")
	       

def console_own_iter(request):
	# print 'yep...'
	global yc,nc
	uncertain_pairs = deduper.uncertainPairs()
	# return  HttpResponse(request.POST['data'])
	label=request.POST['data']
	if label == 'y' :
		yc+=1
		labels['match'].append(record_pair)
		labeled = True
	elif label == 'n' :
		nc+=1
		labels['distinct'].append(record_pair)
		labeled = True
	elif label == 'f':
		# print('Finished labeling', file=sys.stderr)
		finished = True
	elif label != 'u':
		uc+=1
		# print('Nonvalid response', file=sys.stderr)
		raise
	print labels
	print label
	if labeled:
		deduper.markPairs(labels)

	# return HttpResponse("OK...")
	finished = False
	global flgg
	global fields
	if flgg==1:
		fields=[]
		fields = unique(field.field
						for field
						in deduper.data_model.primary_fields)
		flgg=0


	n_match, n_distinct = (len(deduper.training_pairs['match']),
							len(deduper.training_pairs['distinct']))

	uncertain_pairs = deduper.uncertainPairs() 

	# labels = {'distinct' : [], 'match' : []}

	send_user={}
	global record_pair
	for record_pair in uncertain_pairs:
		label = ''
		labeled = False

		for pair in record_pair:
			for field in fields:
				send_user[field]=pair[field]
	send_user['positive']=yc
	send_user['negative']=nc
	print str(yc)
	print str(nc)
	# print send_user
	ke=[]
	val=[]
	for key in sorted(send_user.keys()):
		ke.append(key)
		val.append(send_user[key])
	html="<table class='table'>"
	html+="<thead>"
	for c in key :
		html+="<th>"
		html+=str(c)
		html+="</th>"
	html+="</thead>"
	html+="<tbody><tr>"
	for v in val:
		html+="<td>"
		html+=str(v)
		html+="</td>"
	html+="</tr></tbody>"
	html+="</table>"
	return HttpResponse(html)