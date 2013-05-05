__author__ = 'clement'

from google.appengine.ext import db


class XmlData(db.Model):
    titre = db.StringProperty()
    data = db.TextProperty()
