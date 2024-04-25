# .bash_functions

function retryssh() {
    read -p "Enter the hostname or IP of your server :" servername
    until ssh $servername; do
            sleep 5
    done
}
