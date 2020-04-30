chromium_browser = "chromium-browser"
subprocess.run("pkill -f "+chromium_browser, shell=True)
subprocess.run("rm -rf  ~/.cache/chromium/", shell=True)
subprocess.run(chromium_browser + ' --disable-infobars --kiosk --app="http://127.0.0.1:5000" --disable-features=InfiniteSessionRestore --noerrdialogs --noerrordialogs --remote-debugging-port=9222', shell=True)
