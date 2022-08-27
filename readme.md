# Sample Aplikasi Web

Aplikasi ini dibuat containerized menggunakan stack python dan golang yang mengambil sumber data dari numbersapi[dot]com, untuk implementasi pada cluster kubernetes. terdiri dari 2 services (frontend dan backend), untuk backend akan melayani REST API dan frontend nya untuk menampilkan data dari backend yang terkoneksi menggunakan DNS internal yang tersedia pada kubernetes. aplikasi ini juga dapat dikembangkan dan dijalankan menggunakan docker-compose pada local komputer masing-masing. 
### Prerequisites
- docker 
- kubectl
- helm
- docker-compose

## How to
#### Kubernetes Environment
Untuk *deploy* ke *development* gunakan command berikut:
```
./deploy-dev.sh
```
Untuk *deploy* ke *staging* gunakan command berikut:
```
./deploy-stg.sh
```
Untuk *deploy* ke *production* gunakan command berikut:
```
./deploy-prd.sh
```
*catatan: untuk testing saat ini masih menggunakan namespaces **default** pada semua stage.*
#### Local Environment
untuk menjalankan pada local komputer dapat menggunakan docker-compose berikut:
```
./deploy-local.sh
```