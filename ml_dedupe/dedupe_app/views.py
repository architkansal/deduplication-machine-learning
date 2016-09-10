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


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")


def home(request):
	return render(request,'home.html')

def attrib(request):
	uploaded_filename = open('tmp_dir2/sample.csv')
	reader = csv.reader(uploaded_filename)
	x = next(reader)
	return render(request,'dropdown.html',{'data':x})

def get_data(request):
	return render(request, 'home.html', RequestContext(request, locals())) 


def m(request):
	print request.FILES['csv_file']
	folder = 'tmp_dir2/' #request.path.replace("/", "_")
	uploaded_filename = request.FILES['csv_file'].name
	BASE_PATH = '/home//archit/django-user/deduplication-machine-learning/ml_dedupe'
	# create the folder if it doesn't exist.
	try:
		os.mkdir(os.path.join(BASE_PATH, folder))
	except:
		pass

	# save the uploaded file inside that folder.
	full_filename = os.path.join(BASE_PATH, folder, uploaded_filename)
	fout = open(full_filename, 'wb+')
	file_content = ContentFile( request.FILES['csv_file'].read() )

	try:
	# Iterate through the chunks.
		for chunk in file_content.chunks():
			fout.write(chunk)
		fout.close()
		html = "<html><body>SAVED</body></html>"
		return HttpResponse(html)
	except:
		html = "<html><body>NOT SAVED</body></html>"
		return HttpResponse(html)

def got_it(request):
	print request.POST['attr']
	print request.POST['comp']
	html = "<html><body>NOT SAVED</body></html>"
	return HttpResponse(html)
