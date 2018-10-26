# Чтобы google chrome подключался к текущему рабочему столу linux

touch ~/.chrome-remote-desktop-session

# содержиме файла .chrome-remote-desktop-session
[Desktop Entry]
Name=Lubuntu
Comment=Chrome remote desktop Lubuntu 17.03
exec /usr/sbin/lightdm-session "/usr/bin/lxsession -s Lubuntu -e LXDE"
Type=Application

# изменить в файле 
# sudo vim /opt/google/chrome-remote-desktop/chrome-remote-desktop

FIRST_X_DISPLAY_NUMBER = 0 # найти и изменить

# закоменить
#while os.path.exists(X_LOCK_FILE_TEMPLATE % display):
# display += 1
#relaunch_times.append(x_server_inhibitor.earliest_relaunch_time)

def launch_session(self, keep_env, x_args):
    self._init_child_env(keep_env)
    self._setup_pulseaudio()
    self._setup_gnubby()
    #self._launch_x_server(x_args)  # закоменить
    #self._launch_x_session()       # закоменить
    display = self.get_unused_display_number()  # <- добавить
    self.child_env["DISPLAY"] = ":%d" % display # <- добавить

# рестартим сервис и радуемся
sudo service chrome-remote-desktop restart
