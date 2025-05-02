In the words of Django co-creator Jacob Kaplan-Moss34, “Code without tests is broken as designed.”Testing can be divided into two main categories: unit and integration. Unit tests check a piece of functionality in isolation, while Integration tests check multiple pieces linked together. Unit tests run faster and are easier to maintain since they focus on only a small piece of code. Integration tests are slower and harder to maintain since a failure doesn’t point you in the specific direction of cause.

# pages/tests.py

from django.test import SimpleTestCase

class HomepageTests(SimpleTestCase):

def test_url_exists_at_correct_location(self):

response = self.client.get("/")

self.assertEqual(response.status_code, 200)

class AboutpageTests(SimpleTestCase):

def test_url_exists_at_correct_location(self):

response = self.client.get("/about/")

self.assertEqual(response.status_code, 200)

To run the tests quit the server with Control+c and type python manage.py test on the command

line to run the tests


