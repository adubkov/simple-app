{%- from "mysql/map.jinja" import mysql with context %}

{{ mysql.pkg }}:
  pkg.installed

{{ mysql.config }}:
  file.managed:
    - source: salt://mysql/files/my.cfg
    - mode: 644
    - template: jinja
    - require:
      - pkg: {{ mysql.pkg }}

{{ mysql.service }}:
  service.running:
    - enable: True
    - require:
      - pkg: {{ mysql.pkg }}
    - watch:
      - file: {{ mysql.config }}

/etc/mysql/conf.d:
  file.directory:
    - makedirs: true
    - mode: 755
