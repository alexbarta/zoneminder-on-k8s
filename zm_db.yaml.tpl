---
apiVersion: v1
kind: Service
metadata:
  name: zm-db
  labels:
    app: zm-db
spec:
  selector:
    app: zm-db
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: zm-db
spec:
  replicas: 1
  selector:
    matchLabels:
      app: zm-db
  template:
    metadata:
      labels:
        app: zm-db
    spec:
      containers:
      - name: zm-db
        image: thisistom/zm_database:v1.30.4
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: zoneminder
        ports:
        - containerPort: 3306
        #securityContext:
        #  privileged: true
