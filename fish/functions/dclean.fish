function dclean
        docker rm (docker ps -a -q -f status=exited)
end
