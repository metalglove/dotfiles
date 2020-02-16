# update_checker.sh
function check_updates()
{
        # count how many updates we have got
        ups=`/usr/lib/update-notifier/apt-check --human-readable | head -1 | awk '{print $1;}'`
        update_status=""
        if [ "$ups" -eq "1" ]
        then
        update_status="There is 1 update"
        elif [ "$ups" -gt "1" ]
        then
        update_status="There are $ups updates"
        else
        update_status="Up to date"
        fi
}
