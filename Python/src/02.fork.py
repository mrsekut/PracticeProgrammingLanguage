# http://marumaru.tonkotsu.jp/python%E3%81%A7%E3%83%97%E3%83%AD%E3%82%BB%E3%82%B9%E3%82%92fork%E3%81%97%E3%81%A6%E3%81%BF%E3%82%8B
import os
import time


def main():

    pid_list = []
    pid_list.append(os.getpid())
    child_pid = os.fork()

    if not child_pid:
        pid_list.append(os.getpid())
        print()
        print("子: こんにちは、私は子プロセスです")
        print(f"子: 私が知っているPID番号は{child_pid}です")
        print(f"子: 私が知っているPID番号は{pid_list}です")

    else:
        pid_list.append(os.getpid())
        print()
        print("親: こんにちは、私は親プロセスです")
        print(f"親: 私が知っているPID番号は{child_pid}です")
        print(f"親: 私が知っているPID番号は{pid_list}です")

    time.sleep(10)


if __name__ == '__main__':
    main()
