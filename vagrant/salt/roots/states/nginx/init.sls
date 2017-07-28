nginx:
  pkg.installed: []
  service.running:
    - require:
      - pkg: nginx

# TODO: deploy nginx configs and reloads
