base:
  '*':
    - common

  'roles:app':
    - match: grain
    - common
    - memcached
    - mysql
    - nginx
    - app
