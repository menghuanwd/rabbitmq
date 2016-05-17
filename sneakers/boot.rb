require 'sneakers'
require 'sneakers/metrics/logging_metrics'

Sneakers.configure :metrics => Sneakers::Metrics::LoggingMetrics.new

Sneakers.configure  heartbeat: 2,
                    amqp: 'amqp://guyifeng:password@127.0.0.1:5672',
                    vhost: '/',
                    # daemonize: true,
                    start_worker_delay: 0.2,
                    workers: 1,
                    ack: true,
                    timeout_job_after: 60,
                    durable: true
                    # pid_path: File.expand_path("../../pids/sneakers.pid", __FILE__),
                    # log: File.expand_path("../../log/sneakers.log", __FILE__)

Sneakers.logger.level = Logger::INFO