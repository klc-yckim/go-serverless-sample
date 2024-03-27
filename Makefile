############################################
#	       golang-lambda-sample            #
############################################

############################################
#				Variables				   #
############################################
# Makefile Variables

# NAME 프로젝트 이름
NAME		=	golang-lambda-sample

# 빌드할 main 파일 경로
PATH		=  ./cmd/app

# 빌드 파일의 이름
FILE_NAME	=	main

############################################
#				Text Color		           #
############################################
GREEN		=	\033[32m
BG_GREEN	=	\033[42m
WHITE		=	\033[37m
END			=	\033[0m

############################################
#				Rules		               #
############################################

## ----------------------------------------------------------------------
## 명령을 실행시키기 위해서는 다음과 같이 선언해야 합니다.
## make 옵션
## ----------------------------------------------------------------------

## ----------------------------------------------------------------------
## |                       📌 Makefile 옵션 목록                        |
## ----------------------------------------------------------------------

##
##

## help	: Algorim Makefile 명령에 대해 출력해줍니다.
##
help:
			@sed -n '/@sed/!s/## //p' Makefile

## build	: 실행할 수 있는 실행파일을 만듭니다.
##
build:
	@echo "$(WHITE) 🛠️ $(NAME) 실행파일 생성중...$(END)"
	@go build -o $(FILE_NAME) $(PATH)/$(FILE_NAME).go
	@echo "$(BG_GREEN) ✔️$(END) $(GREEN) $(NAME) 실행파일 생성완료 $(END)"

## run	: 실행 파일을 만들지 않고 프로그램을 실행합니다.
run:
	@go run $(PATH)/$(FILE_NAME).go

## start	: 실행 파일을 만든 후(빌드 진행) 프로그램을 실행합니다.
start: build
		./main

## clean	: 실행 파일을 제거합니다.
clean:
	@echo "$(WHITE)🧹 $(NAME) 실행파일 삭제중... $(END)"
	@rm -rf $(FILE_NAME)
	@echo "✅️ $(NAME) 실행파일 삭제완료 $(END)"

## test	: 테스트를 실행합니다.
test:
	@echo "$(WHITE)🧪 $(NAME) 테스트 시작... $(END)"
	@go test ./...

## re	: 실행 파일을 삭제한 후 재 빌드 후 실행시킵니다.
re: clean start

## ----------------------------------------------------------------------

.PHONY: help build run start test clean re