# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/daemons/all/daemons.rbi
#
# daemons-1.4.0

module Daemons
  def call(options = nil, &block); end
  def controller; end
  def daemonize(options = nil); end
  def group; end
  def new(options = nil, &block); end
  def run(script, options = nil); end
  def run_proc(app_name, options = nil, &block); end
  def self.call(options = nil, &block); end
  def self.controller; end
  def self.daemonize(options = nil); end
  def self.group; end
  def self.new(options = nil, &block); end
  def self.run(script, options = nil); end
  def self.run_proc(app_name, options = nil, &block); end
end
class Daemons::Exception < RuntimeError
end
class Daemons::RuntimeException < Daemons::Exception
end
class Daemons::CmdException < Daemons::Exception
end
class Daemons::Error < Daemons::Exception
end
class Daemons::SystemError < Daemons::Error
  def initialize(msg, system_error); end
  def system_error; end
end
class Daemons::TimeoutError < Daemons::Error
end
class Daemons::Pid
  def cleanup; end
  def exist?; end
  def initialize; end
  def pid; end
  def pid=(p); end
  def running?; end
  def self.dir(dir_mode, dir, script); end
  def self.running?(pid); end
  def zap; end
end
class Daemons::PidFile < Daemons::Pid
  def cleanup; end
  def dir; end
  def exist?; end
  def filename; end
  def initialize(dir, progname, multiple = nil, pid_delimiter = nil); end
  def multiple; end
  def number; end
  def pid; end
  def pid=(p); end
  def pid_delimiter; end
  def progname; end
  def self.existing(path); end
  def self.find_files(dir, progname, delete = nil, pid_delimiter = nil); end
  def zap; end
end
class Daemons::Optparse
  def initialize(controller); end
  def parse(args); end
  def usage; end
end
class Daemons::Controller
  def app_name; end
  def catch_exceptions(&block); end
  def group; end
  def initialize(options = nil, argv = nil); end
  def options; end
  def print_usage; end
  def run; end
  def self.split_argv(argv); end
  def setup_options; end
end
module Daemonize
  def call_as_daemon(block, logfile_name = nil, app_name = nil); end
  def close_io; end
  def daemonize(logfile_name = nil, app_name = nil); end
  def redirect_io(logfile_name); end
  def safefork; end
  def self.call_as_daemon(block, logfile_name = nil, app_name = nil); end
  def self.close_io; end
  def self.daemonize(logfile_name = nil, app_name = nil); end
  def self.redirect_io(logfile_name); end
  def self.safefork; end
  def self.simulate(logfile_name = nil, app_name = nil); end
  def simulate(logfile_name = nil, app_name = nil); end
end
class Daemons::Monitor
  def initialize(an_app, options = nil); end
  def self.find(dir, app_name); end
  def start(application_group); end
  def start_with_pidfile(application_group); end
  def start_without_pidfile(application_group); end
  def stop; end
  def watch(application_group); end
end
class Daemons::PidMem < Daemons::Pid
  def pid; end
  def pid=(arg0); end
  def self.existing(numeric_pid); end
end
module Etc
  def self.groupname(gid); end
  def self.username(uid); end
end
class CurrentProcess
  def self.change_privilege(user, group = nil); end
end
class Daemons::Reporter
  def backtrace_not_supported; end
  def cannot_stop_process(app_name, pid); end
  def changing_process_privilege(user, group = nil); end
  def deleted_found_pidfile(pid, f); end
  def initialize(options); end
  def options; end
  def output_message(message); end
  def process_started(app_name, pid); end
  def status(app_name, running, pid_exists, pid); end
  def stopped_process(app_name, pid); end
  def stopping_process(app_name, pid, sig, wait); end
end
class Daemons::Application
  def app_argv; end
  def app_argv=(arg0); end
  def change_privilege; end
  def controller_argv; end
  def controller_argv=(arg0); end
  def default_show_status(daemon = nil); end
  def dir; end
  def dir_mode; end
  def exception_log; end
  def group; end
  def initialize(group, add_options = nil, pid = nil); end
  def log_output?; end
  def log_output_syslog?; end
  def logdir; end
  def logfile; end
  def logfilename; end
  def options; end
  def output_logfile; end
  def output_logfilename; end
  def parse_signals_and_waits(argv); end
  def pid; end
  def pidfile_dir; end
  def reload; end
  def running?; end
  def script; end
  def show_status; end
  def show_status_callback=(function); end
  def start(restart = nil); end
  def start_exec; end
  def start_load; end
  def start_none; end
  def start_proc; end
  def started; end
  def stop(no_wait = nil); end
  def wait_and_retry_kill_harder(pid, remaining_signals, no_wait = nil); end
  def zap!; end
  def zap; end
end
class Daemons::ApplicationGroup
  def app_argv; end
  def app_argv=(arg0); end
  def app_name; end
  def applications; end
  def controller_argv; end
  def controller_argv=(arg0); end
  def create_monitor(an_app); end
  def dir; end
  def dir=(arg0); end
  def dir_mode; end
  def dir_mode=(arg0); end
  def find_applications(dir); end
  def find_applications_by_app_name(app_name); end
  def find_applications_by_pidfiles(dir); end
  def initialize(app_name, options = nil); end
  def monitor; end
  def multiple; end
  def new_application(add_options = nil); end
  def options; end
  def pidfile_dir; end
  def reload_all; end
  def running?; end
  def script; end
  def setup; end
  def setup_app(app); end
  def show_status; end
  def start_all; end
  def stop_all(no_wait = nil); end
  def zap_all; end
end
