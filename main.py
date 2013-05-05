# -*- coding: utf-8 -*-
import webapp2
import jinja2
import os



from xsdtoform import XsdToForm, XmlToHtml

JINJA_ENVIRONMENT = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))




class MainPage(webapp2.RequestHandler):
    def get(self):


        html = '';

        r = list()

        html = u"""<h2>Application XSD to Form</h2>
        <p>L'application permet de générer un formulaire par partir d'un Xml Schema.
        Le formulaire respecte l'arboraissance du fichier xml final. On récupaire le
        xml en javascript grace à l'arboraissance du formulaire et du nom des inputs. Le xml est
        ensuite envoyé par le biais d'un Http post. On vérifie s'il est conforme au schema et on le stoque en datastore.
        </p>"""
        r.append(html)
        html = '';
        html = u"""<h2>Application XML to Html</h2>
        <p> Simple transformation xsl. Juste pour visualiser le résultat envoyé par le formulaire
        et montrer que ca fonctionne. </p>"""

        r.append(html)
        template_values = {
            'content': r,

        }

        template = JINJA_ENVIRONMENT.get_template('templates/main.html')
        self.response.write(template.render(template_values))
        #self.response.write(str(result))

    def post(self):
        pass



app = webapp2.WSGIApplication([('/', MainPage),
                                  ('/xsdtoform', XsdToForm),
                                  ('/xmltohtml', XmlToHtml),
                                  ('/xmltohtml/([^/]+)', XmlToHtml)],

                              debug=True)