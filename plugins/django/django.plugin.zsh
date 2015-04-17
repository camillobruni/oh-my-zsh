#compdef manage.py

typeset -ga nul_args
nul_args=(
  '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=verbose output, 3=very verbose output]:Verbosity:((0\:minimal 1\:normal 2\:verbose 3\:very verbose))' \
  '--settings=-[the Python path to a settings module.]:file:_files'
  '--pythonpath=-[a directory to add to the Python path.]::directory:_directories'
  '--traceback[print traceback on exception.]'
  "--version[show program's version number and exit.]"
  {-h,--help}'[show this help message and exit.]'
)

_managepy-adminindex(){
  _arguments -s : \
    $nul_args \
    '*::directory:_directories' && ret=0
}

_managepy-createcachetable(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-dbshell(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-diffsettings(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-dumpdata(){
  _arguments -s : \
    '--format=-[specifies the output serialization format for fixtures.]:format:(json yaml xml)' \
    '--indent=-[specifies the indent level to use when pretty-printing output.]:' \
    $nul_args \
    '*::appname:_applist' && ret=0
}

_managepy-flush(){
  _arguments -s : \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    $nul_args && ret=0
}

_managepy-help(){
  _arguments -s : \
    '*:command:_commandlist' \
    $nul_args && ret=0
}
_managepy-inspectdb(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-loaddata(){
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '*::file:_files' \
    $nul_args && ret=0
}

_managepy-migrate(){
  _arguments -s : \
    '--all[Run the specified migration for all apps.]' \
    '--list[List migrations noting those that have been applied.]' \
    '--changes[List changes for migrations.]' \
    '--skip[Will skip over out-of-order missing migrations.]' \
    '--merge[Will run out-of-order missing migrations as they are. No rollbacks.]' \
    '--no-intial-data[Skips loading initial data if specified.]' \
    '--fake[Pretends to do the migrations, but do not actually execute them.]' \
    '--db-dry-run[Does not execute the SQL generated by the db methods.]' \
    '--delete-ghost-migrations[Tells South to delete any ghost migrations (ones in the database but not on disk).]' \
    '--ignore-ghost-migrations[Tells South to ignore any ghost migrations (ones in the database but not on disk) and continue to apply new migrations.]' \
    '--noinput[Tells Django to NOT prompt the user for input.]' \
    '--database=[Nominates a database to synchronize..]' \
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-reset(){
  _arguments -s : \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-runfcgi(){
  local state
  
  local fcgi_opts
  fcgi_opts=(
    'protocol[fcgi, scgi, ajp, ... (default fcgi)]:protocol:(fcgi scgi ajp)'
    'host[hostname to listen on..]:'
    'port[port to listen on.]:'
    'socket[UNIX socket to listen on.]::file:_files'
    'method[prefork or threaded (default prefork)]:method:(prefork threaded)'
    'maxrequests[number of requests a child handles before it is killed and a new child is forked (0 = no limit).]:'
    'maxspare[max number of spare processes / threads.]:'
    'minspare[min number of spare processes / threads.]:'
    'maxchildren[hard limit number of processes / threads.]:'
    'daemonize[whether to detach from terminal.]:boolean:(False True)'
    'pidfile[write the spawned process-id to this file.]:file:_files'
    'workdir[change to this directory when daemonizing.]:directory:_files'
    'outlog[write stdout to this file.]:file:_files'
    'errlog[write stderr to this file.]:file:_files'
  )
  
  _arguments -s : \
    $nul_args \
    '*: :_values "FCGI Setting" $fcgi_opts' && ret=0
}

_managepy-runserver(){
  _arguments -s : \
    '--noreload[tells Django to NOT use the auto-reloader.]' \
    '--adminmedia[specifies the directory from which to serve admin media.]:directory:_files' \
    $nul_args && ret=0
}

_managepy-schemamigration(){
  _arguments -s : \
    '--stdout[Print the migration to stdout instead of writing it to a file.]' \
	'--auto[Attempt to automatically detect differences from the last migration.]'\
	'--initial[Generate the initial schema for the app.]'\
	'--empty[Make a blank migration.]'\
	'--update[Update the most recent migration instead of creating a new one. Rollback this migration if it is already applied.]'\
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-shell(){
  _arguments -s : \
    '--plain[tells Django to use plain Python, not IPython.]' \
    $nul_args && ret=0
}

_managepy-sql(){}
_managepy-sqlall(){}
_managepy-sqlclear(){}
_managepy-sqlcustom(){}
_managepy-sqlflush(){}
_managepy-sqlindexes(){}
_managepy-sqlinitialdata(){}
_managepy-sqlreset(){}
_managepy-sqlsequencereset(){}
_managepy-startapp(){}

_managepy-syncdb() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    $nul_args && ret=0
}

_managepy-test() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-testserver() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--addrport=-[port number or ipaddr:port to run the server on.]' \
    '*::fixture:_files' \
    $nul_args && ret=0
}

_managepy-validate() {
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-commands() {
  local -a commands
  
  commands=(
  'celery:celery commands, see celery help'
  'celerybeat:Old alias to the "celery beat" command'
  'celerycam:Takes snapshots of the clusters state to the database'
  'celeryd:Old alias to the "celery worker" command'
  'celeryd_detach:Runs a detached Celery worker node'
  'celeryd_multi:Manage multiple Celery worker nodes'
  'celerymon:Run the celery monitor'
  'changepassword:Change a user password for django'
  'check:Checks compatibility of your configuration with this version of Django'
  'clean_kombu_messages:'
  'clean_pyc:Removes all python bytecode compiled files from the project'
  'cleanup:Can be run as a cronjob or directly to clean out expired sessions'
  'clearsessions:Can be run as a cronjob or directly to clean out expired sessions'
  'cms:django CMS command line interface'
  'collectstatic:Collect static files in a single location'
  'compile_pyc:Compile python bytecode files for the project'
  'compilemessages:Compiles'
  'completion:Closes the specified poll for voting'
  'convert_to_south:Quickly converts the named application to use South if it is currently using syncdb'
  'create_app:Creates an application directory structure for the specified application name'
  'create_command:Creates a Django management command directory structure for the given app name in the current directory'
  'create_jobs:Creates a Django jobs command directory structure for the given app name in the current directory'
  'createcachetable:Creates the table needed to use the SQL cache backend'
  'createsuperuser:Used to create a superuser'
  'customdashboard:Creates a template file containing the base code to get you started with your custom dashboard'
  'custommenu:Creates a template file containing the base code to get you started with your custom menu'
  'datamigration:Creates a new template data migration for the given app'
  'dbshell:Runs the command-line client for specified/default database'
  'describe_form:Outputs the specified model as a form definition to the shell'
  'diffsettings:Displays differences between the current settings'
  'djcelerymon:Starts Django Admin instance and celerycam in the same process'
  'dumpdata:Output the contents of the database as a fixture of the given format'
  'dumpscript:Dumps the data as a customised python script'
  'export_emails:Export user email address list in one of a number of formats'
  'find_template:Finds the location of the given template by resolving its path'
  'findstatic:Finds the absolute paths for the given static file(s)'
  'flush:Returns the database to the state it was in immediately after syncdb was executed'
  'generate_secret_key:Generates a new SECRET_KEY that can be used in a project settings file'
  'graph_models:Creates a GraphViz dot file for the specified app names'
  'graphmigrations:Outputs a GraphViz dot file of all migration dependencies to stdout'
  'help'
  'inspectdb:Introspects the database tables in the given database and outputs a Django model module'
  'loaddata:Installs the named fixture(s) in the database'
  'mail_debug:Starts a test mail server for development'
  'makemessages:Runs over the entire source tree of the current directory and pulls out all strings marked for translation'
  'migrate:Runs migrations for all apps'
  'migrationcheck:Runs migrations for each app in turn, detecting missing depends_on values'
  'notes:Show all annotations like TODO, FIXME, HACK, BUG or XXX in your py and HTML files'
  'passwd:Clone of the UNIX program ``passwd'', for django'
  'ping_google:Ping Google with an updated sitemap, pass optional url of sitemap'
  'print_settings:Print the active Django settings'
  'print_user_for_session:print the user information for the provided session key'
  'publisher_publish:'
  'raven:Commands to interact with the Sentry client'
  'reset_db:Resets the database for this project'
  'runfcgi:Runs this project as a FastCGI application'
  'runjob:Run a single maintenance job'
  'runjobs:Runs scheduled maintenance jobs'
  'runprofileserver:Starts a lightweight Web server with profiling enabled'
  'runscript:Runs a script in django context'
  'runserver:Starts a lightweight Web server for development and also serves static files'
  'runserver_plus:Starts a lightweight Web server for development'
  'schemamigration:Creates a new template schema migration for the given app'
  'set_fake_emails:DEBUG only: give all users a new email based on their account data'
  'set_fake_passwords:DEBUG only: sets all user passwords to a common value'
  'shell:Runs a Python interactive interpreter'
  'shell_plus:Like the shell command but autoloads the models of all installed Django apps'
  'show_templatetags:Displays template tags and filters available in the current project'
  'show_urls:Displays all of the url matching routes for the project'
  'sql:Prints the CREATE TABLE SQL statements for the given app name(s)'
  'sqlall:Prints the CREATE TABLE, custom SQL and CREATE INDEX SQL statements for the given model module name(s)'
  'sqlclear:Prints the DROP TABLE SQL statements for the given app name(s)'
  'sqlcreate:Generates the SQL to create your database for you, as specified in settings'
  'sqlcustom:Prints the custom table modifying SQL statements for the given app name(s)'
  'sqldiff:Prints the (approximated) difference between models and fields in the database for the given app name(s)'
  'sqldropindexes:Prints the DROP INDEX SQL statements for the given model module name(s)'
  'sqlflush:Returns a list of the SQL statements required to return all tables in the database to the state they were in just after they were installed'
  'sqlindexes:Prints the CREATE INDEX SQL statements for the given model module name(s)'
  'sqlinitialdata:RENAMED: see sqlcustom'
  'sqlsequencereset:Prints the SQL statements for resetting sequences for the given app name(s)'
  'startapp:Creates a Django app directory structure for the given app name in the current directory or optionally in the given directory'
  'startmigration:Deprecated command'
  'startproject:Creates a Django project directory structure for the given project name in the current directory or optionally in the given directory'
  'syncdata:Makes the current database have the same data as the fixture(s), no more, no less'
  'syncdb:Create the database tables for all apps in INSTALLED_APPS whose tables have not yet been created, except those which use migrations'
  'test:Discover and run tests in the specified modules or the current directory'
  'testserver:Runs a development server with data from the given fixture(s)'
  'unreferenced_files:Prints a list of all files in MEDIA_ROOT that are not referenced in the database'
  'update_permissions:reloads permissions for specified apps, or all apps if no args are specified'
  'validate:Validates all installed models'
  'validate_templates:Validate templates on syntax and compile errors'
  )
  
  _describe -t commands 'manage.py command' commands && ret=0
}

_commandlist(){
    local line
    local -a cmd
    _call_program help-command ./manage.py help \
      | sed -n '/^    [a-z]/s/[(), ]/ /gp' \
      | while read -A line; do cmd=($line $cmd) done
    _describe -t managepy-command 'manage.py command' cmd
}

_applist() {
  local line
  local -a apps
  _call_program help-command "python -c \"import os.path as op, re, django.conf, sys;\\
  print('\n'.join(django.conf.settings.INSTALLED_APPS)) \"" \
                             | while read -A line; do apps=($line $apps) done
  _values 'Application' $apps && ret=0
}

_managepy() {
  local curcontext=$curcontext ret=1
  
  if ((CURRENT == 2)); then
    _managepy-commands
  else
    shift words
    (( CURRENT -- ))
    curcontext="${curcontext%:*:*}:managepy-$words[1]:"
    _call_function ret _managepy-$words[1]
  fi
}

compdef _managepy manage.py
compdef _managepy django
compdef _managepy django-manage
