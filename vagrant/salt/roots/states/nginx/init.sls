nginx:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: nginx

/etc/nginx:
  file.recurse:
    - source: salt://nginx/files/configs
    - makedirs: True
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx
