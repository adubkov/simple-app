nodejs:
  pkg.installed

/opt/app:
  file.recurse:
    - source: salt://app/files/src
    - makedirs: True

app:
  file.managed:
    - name: /etc/systemd/system/app.service
    - source: salt://app/files/service
    - mode: 755
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: app
  service.running:
    - name: app
    - enable: True
    - watch:
      - module: app
