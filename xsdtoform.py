
import os
import webapp2
import jinja2
from lxml import etree
from google.appengine.ext import db
from models import XmlData

__author__ = 'clement'

JINJA_ENVIRONMENT = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))

def xmldata_key(name=None):
    return db.Key.from_path('XmlData', name or 'default_xmldata')

class XsdToForm(webapp2.RequestHandler):
    def get(self):
        style = etree.parse('xsl_templates/main.xsl')

        self.output = ''

        tree = etree.parse('res/SchemaXML.xsd')

        trans = etree.XSLT(style)
        result = trans(tree)
        self.root = tree.getroot()


        r = list()
        r.append(result)
        template = JINJA_ENVIRONMENT.get_template('templates/form1.html')
        r.append(template.render())
        template_values = {
            'content': r,

        }

        template = JINJA_ENVIRONMENT.get_template('templates/main.html')
        self.response.write(template.render(template_values))


    def post(self):

        xd_key = xmldata_key()
        xmldata = XmlData(parent=xd_key)


        r = list()

        style = etree.parse('res/style.xsl')
        tree = etree.XML(self.request.get('result'))
        xmldata.titre = tree.find('circuit').find('titre').text
        xmldata.data = self.request.get('result')
        xmldata.put()


        trans = etree.XSLT(style)
        result = trans(tree)



        r.append(result)

        template_values = {
            'content': r,

        }

        template = JINJA_ENVIRONMENT.get_template('templates/main.html')
        self.response.write(template.render(template_values))

class XmlToHtml(webapp2.RequestHandler):

    def get(self, dataId=None):
        if dataId:
            xml = XmlData.get(dataId)
            r = list()
            style = etree.parse('res/style.xsl')
            tree = etree.XML(xml.data)



            trans = etree.XSLT(style)
            result = trans(tree)



            r.append(result)

            template_values = {
                'content': r,

            }

            template = JINJA_ENVIRONMENT.get_template('templates/main.html')
            self.response.write(template.render(template_values))

        else:
            html = '<table>'
            xmldatas = db.GqlQuery("SELECT * FROM XmlData")
            for aData in xmldatas:
                html += '<tr><td>' + aData.titre + '</td><td><a href="xmltohtml/'+ unicode(aData.key()) + '">Afficher</a></td></tr>'
            html += '</table>'

            r = list()
            r.append(html)
            template_values = {
            'content': r,

            }

            template = JINJA_ENVIRONMENT.get_template('templates/main.html')
            self.response.write(template.render(template_values))

