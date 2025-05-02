$source .venv/bin/activate

$ django-admin startproject django_project
$cd django_project
$ls
django_project
	init.py
	asgi.py
	settings.py
	urls.py
	wsgi.py
db.sqlite3 
manage.py

$python manage.py startapp pages

$ls
django_project
	init.py
	asgi.py
	settings.py
	urls.py
	wsgi.py
pages
	_init_.py
	admin.py
	apps.py
	migrations
		init.py
	models.py
	tests.py
	views.py
db.sqlite3 
manage.py

$mkdir templates


settings.py => controls our Django project’s overall settings
manage.py =>execute various Django commands

Manage.py commands 
runserver
python manage.py test=>System check identifion issues or errors before run server 

$ Ctrl+c =>To stop the server 
$ deactivate => To leave env virtual environment

HTTP is a request-response protocol that works in a client-server computing model. Every time you visit a webpage an initial request is sent by the “client” (ie your computer) and a “response” is sent back by a “server.”

Django request/response cycle
HTTP Request - URL - View - Model and Template - HTTP Response

Django uses the concept of projects and apps to keep code clean and readable. A single top-level.Django project can contain multiple apps. Each app controls an isolated piece of functionality.

For example, an e-commerce site might have 
one app for user authentication, another app for payments, and a third app to power item listing details. That’s three distinct apps that all live within one top-level project.

So,startapp command followed by the name of our app pages
$ python manage.py startapp pages



The Django MVT pattern is as follows:
• Model: Manages data and core business logic
• View: Describes which data is sent to the user but not its presentation
• Template: Presents the data as HTML with optional CSS, JavaScript, and Statics
• URL Configuration: Regular-expression components configured to a View



• models.py
• views.py
• template.html
• urls.py



Even though our new app exists within the Django project, Django doesn’t “know” about it until we explicitly add it to the django_project/settings.py file

What is PagesConfig you might ask? Well, it is the name of the solitary function within the pages/apps.py file at this point.


# Templates folder to django
Create folder templates as level of manage.py

django_project/settings.py
```python
TEMPLATES = [
		{
		...
		"DIRS": [BASE_DIR / "templates"], # new
		...
		},
]
````


# App folder(pages) to django


django_project/urls.py
```python
from django.contrib import admin
from django.urls import path, include # new

urlpatterns = [
path("admin/", admin.site.urls),
path("", include("pages.urls")), # new
]
```

django_project/settings.py
```python
INSTALLED_APPS = [
"django.contrib.admin",
"django.contrib.auth",
"django.contrib.contenttypes",
"django.contrib.sessions",
"django.contrib.messages",
"django.contrib.staticfiles",
"pages.apps.PagesConfig", # added
]
````
Check by Open pages/apps.py.it looks like class pagesconfig 
# Add views

Create a home.html file in templates folder  and write the html code

pages/views.py
```python
from django.views.generic import TemplateView

class HomePageView(TemplateView):
template_name = "home.html"
```


pages/urls.py
```python
from django.urls import path
from .views import homePageView

urlpatterns = [ 
path("", homePageView, name="home"),
]
```


# Add another view
templates/about.html
```html
<h1>About page</h1>
````

pages/views.py
```python
from django.views.generic import TemplateView

class HomePageView(TemplateView):
template_name = "home.html"

class AboutPageView(TemplateView): # new
template_name = "about.html"
````

 pages/urls.py
```python
from django.urls import path
from .views import HomePageView, AboutPageView # new

urlpatterns = [
path("about/", AboutPageView.as_view(), name="about"), # new
path("", HomePageView.as_view(), name="home"),
]
````

Here " " acts like index.php of folder see in django_project/url and pages/url

# Add all view(Footer)
Let’s create a base.html file as header 
Header contains with links to our two pages 

<!-- templates/base.html -->
<header>
<a href="{% url 'home' %}">Home</a> |
<a href="{% url 'about' %}">About</a>.        
</header>

Static site cycle
Templates=>app view=>app url=>django url


# Models
Upto static site completed
Now database site which stores data


posts/models.py
```python
from django.db import models

# Create your models here
````

posts/models.py
```python
from django.db import models

class Post(models.Model): # new
text = models.TextField()
````
Note that we’ve created a new database model called Post which has the database field text.We’ve also specified the type of content it will hold, TextField(). Django provides many model fields supporting common types of content such as characters, dates, integers, emails, and so on

posts/models.py
```python
from django.db import models

class Post(models.Model):
text = models.TextField()

def __str__(self): # new
return self.text[:50]
````
Django’s ORM will automatically turn this model into a database table for us. 

the commands python manage.py makemigrations posts and python manage.py migrate



Here class post is predefined django class differ from view class??
class (models).  class(templateView)

Class are predefined, () our wish

From django.file type  import our wish
Class predefined(our wish)

Let’s begin with the view. Earlier in the book we used the built-in generic TemplateView to display a template file on our homepage. Now we want to list the contents of our database model.

ListView automatically returns to us a context variable called <model>_list, where <model> is our model name, that we can loop over via the built-in for67 template tag. We’ll create our own variable called post and can then access the desired field we want displayed, text, as post.text.




