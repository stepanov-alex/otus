Задание:
- vagrant up` должен поднимать 2 настроенных виртуальных машины (сервер NFS и клиента) без дополнительных ручных действий; - на сервере NFS должна быть подготовлена и экспортирована директория; 
- в экспортированной директории должна быть поддиректория с именем __upload__ с правами на запись в неё; 
- экспортированная директория должна автоматически монтироваться на клиенте при старте виртуальной машины (systemd, autofs или fstab -  любым способом)
- монтирование и работа NFS на клиенте должна быть организована с использованием NFSv3 по протоколу UDP; 
- firewall должен быть включен и настроен как на клиенте, так и на сервере. 

Каталоги:
- На сервере /srv/share/ создается автоматически при подключении виртуальных машин, записывать клиент может только в папку upload в этой директории.
- На клиенте автоматируется nfs в папку /mnt
Особенности:
- в Vagrantfile добавлена условие для корректной работы vbguest   
 if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
 end
Заметки:
- при выключенном сервере не корректно начинает работать клиент пока не отмантируешь nfs (долго или зависает отработка команд, такие как cd ls и тд...)
