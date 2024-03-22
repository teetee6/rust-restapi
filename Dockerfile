FROM rust:latest

WORKDIR /app/

COPY . .

# ORM인데 postgres
RUN cargo install diesel_cli --no-default-features --features postgres 
RUN cargo install cargo-watch

# 파일 바뀔때마다 백그라운드에서 리빌드 해라 (build말고 run해도 되지만 난 수동이 조아~)
CMD ["cargo", "watch", "--why", "-x", "build"]