FROM alpine:3.12.0 AS builder

ARG GITHUB_TOKEN

RUN apk --no-cache add git

# RUN git clone https://$GITHUB_TOKEN@github.com/vintage007/keystore.git \
#     && mv keystore/keystore.jks ./keystore.jks

RUN git clone https://github.com/vintage007/python_file_test.git \
    && mv python_file_test/file.txt ./file.txt


#ADD https://$GITHUB_TOKEN@raw.githubusercontent.com/vintage007/docker-test/master/file.txt file.txt

FROM alpine:3.12.0

# COPY --from=builder ./keystore.jks ./keystore.jks
COPY --from=builder ./file.txt ./file.txt

#docker build --build-arg GITHUB_TOKEN=$(cat GITHUB_ACCESS_TOKEN.txt) -t test .
#Test
