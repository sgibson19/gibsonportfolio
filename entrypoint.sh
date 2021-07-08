#!/bin/sh
flask db migrate
flask db upgrade
<<<<<<< HEAD
gunicorn wsgi:app -w 1 -b 0.0.0.0:80 --capture-output --log-level debug
=======
gunicorn wsgi:app -w 1 -b 0.0.0.0:80 --capture-output --log-level debug
>>>>>>> 39dbf4f0f222109211b3ac7da5f9d09bb5c3ccff
