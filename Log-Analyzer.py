from logs_analyzer.lib import LogsAnalyzer
#please provide your IP to check the logs
IP=''

nginx_logsanalyzer = LogsAnalyzer('nginx')
nginx_logsanalyzer.add_date_filter(minute='*', hour=22, day=4, month=5)
nginx_logsanalyzer.add_filter(IP)
requests = nginx_logsanalyzer.get_requests()
print(requests)
           
