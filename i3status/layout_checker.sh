# layout_checker.sh
function check_layout()
{
        layout_status="layout: $(setxkbmap -query | awk '/layout/{print $2}')"
}
