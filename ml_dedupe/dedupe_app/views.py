from django.conf import settings
from django.shortcuts import render, render_to_response, redirect
from django.http import HttpResponse, HttpResponseRedirect, HttpRequest, Http404,JsonResponse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required,user_passes_test
from django.contrib.auth.models import User
from django.db.models import Count, Min, Sum, Avg

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")


def home(request):
	return render(request,'home.html')