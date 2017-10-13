imdock-web2pdf
====================================================
## What's this:

ubuntu(Python)

## How to install:

    ~ $ mkdir {project-name}
    ~ $ cd {project-name}
    ~/{project-name} $ git clone https://github.com/suwaychang/imdock-web2pdf
    ~/{project-name} $ cd imdock-web2pdf

#### change your custom settting

    ~/{project-name}/imdock-web2pdf $ docker-compose up
    or
    ~/{project-name}/imdock-web2pdf $ docker-compose up -d

## Reference architecture:

```txt
{project-name}
├── imdock-html2pdf
│   ├── script
│   ├── test
│   ├── Dockerfile
│   └── docker-compose.yml

```

## 使用範例:
ssh 下執行
```txt
curl -H "Content-Type: application/json" \
	-d '{"url":"http://www.google.com"}' \
	http://localhost:8080/pdf/convert

```

##輸出格式
```txt
 {
     "result": {
         "pdf_url": "http://localhost:8080/pdfout/yv2iWaQOLPN.pdf",
         "url": "http://www.google.com"
     }
 }
```