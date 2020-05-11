#!usr/bin/env bash

if [[ ! -f thread.json ]];then
	curl -s "https://www.yuque.com/api/docs?book_id=844742^&include_comment_users=true^&include_last_editor=true^&include_my_collaboration=true^&include_schedule_configs=true^&include_share=true^&include_user=true^&limit=50^&offset=0^&only_order_by_id=true" -o thread.json
fi


