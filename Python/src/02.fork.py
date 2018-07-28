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
