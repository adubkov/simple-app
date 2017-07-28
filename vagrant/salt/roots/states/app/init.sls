nodejs:
  pkg.installed

/opt/app:
  file.recurse:
    - source: salt://app/files/src
    - makedirs: True

# TODO: start app as service (systemd)
