{% set hostname = grains['id'] %}
{% set hosts_file = '/etc/hosts' %}
{% set hostname_file = {
  'path': '/etc/hostname',
  'content': hostname,
} %}

{{ hostname_file.path }}:
  file.managed:
    - contents: |
        {{ hostname_file.content }}

set_hostname:
  cmd.run:
    - name: hostname {{ hostname }}
    - unless: hostname | grep -q {{ hostname }}

{{ hosts_file }}:
  file.replace:
    - pattern: |
        ^127\.0\.0\.1.*
    - repl: |
        127.0.0.1 {{ hostname }}.local {{ hostname }} localhost
    - count: 1
    - append_if_not_found: True
    - show_changes: True
