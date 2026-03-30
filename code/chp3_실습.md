{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": []
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "source": [
        "### STEP 1: 시스템 선택\n",
        "- **게임 유저 관리**\n",
        "\n",
        "### STEP 2: 요구사항 작성\n",
        "1. **유저 등록:** 시스템에는 최소 2명 이상의 유저(예: Faker, Chovy)가 등록되어야 한다.\n",
        "2. **고유 식별:** 각 유저는 고유한 `user_id`를 가지며, 아이템 또한 고유한 `item_id`를 가진다.\n",
        "3. **아이템 소유:** 한 명의 유저는 여러 개의 아이템을 보유할 수 있다 (1:N 관계).\n",
        "4. **상세 정보 기록:** 유저는 직업과 레벨 정보를 가지며, 아이템은 공격력과 획득 등급을 가진다.\n",
        "5. **데이터 정렬 및 필터링:** 특정 공격력 이상의 아이템을 조회하거나, 유저를 레벨순으로 정렬할 수 있어야 한다.\n",
        "\n",
        "### STEP 3: 데이터 설계\n",
        "- **[Entities]**\n",
        "  1. **GameUser** (유저 정보)\n",
        "  2. **GameItem** (아이템 정보)\n",
        "\n",
        "- **[GameUser Properties]**\n",
        "  - user_id       VARCHAR(20) PRIMARY KEY (유저 아이디)\n",
        "  - nickname      VARCHAR(30)             (닉네임)\n",
        "  - job           VARCHAR(20)             (직업)\n",
        "  - level         INT                     (레벨)\n",
        "\n",
        "- **[GameItem Properties]**\n",
        "  - item_id       INT PRIMARY KEY         (아이템 고유번호)\n",
        "  - item_name     VARCHAR(50)             (아이템 이름)\n",
        "  - power         INT                     (공격력)\n",
        "  - owner_id      VARCHAR(20)             (소유자 ID - GameUser의 user_id 참조)\n"
      ],
      "metadata": {
        "id": "ALqpMQI6SUSi"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "## Step4: SQL 작성\n",
        "\n",
        "```\n",
        "/*\n",
        "[Entities]\n",
        "- GameUser, GameItem\n",
        "\n",
        "[GameUser Properties]\n",
        "- user_id       VARCHAR(20) PRIMARY KEY\n",
        "- nickname      VARCHAR(30)\n",
        "- job           VARCHAR(20)\n",
        "- level         INT\n",
        "\n",
        "[GameItem Properties]\n",
        "- item_id       INT PRIMARY KEY\n",
        "- item_name     VARCHAR(50)\n",
        "- power         INT\n",
        "- owner_id      VARCHAR(20) (Foreign Key)\n",
        "*/\n",
        "\n",
        "-- 1. 테이블 생성\n",
        "-- 유저 테이블\n",
        "CREATE TABLE GameUser (\n",
        "    user_id VARCHAR(20) PRIMARY KEY,\n",
        "    nickname VARCHAR(30),\n",
        "    job VARCHAR(20),\n",
        "    level INT\n",
        ");\n",
        "\n",
        "-- 아이템 테이블\n",
        "CREATE TABLE GameItem (\n",
        "    item_id INT PRIMARY KEY,\n",
        "    item_name VARCHAR(50),\n",
        "    power INT,\n",
        "    owner_id VARCHAR(20),\n",
        "    FOREIGN KEY (owner_id) REFERENCES GameUser(user_id)\n",
        ");\n",
        "\n",
        "-- 2. 데이터 삽입\n",
        "-- 유저 데이터\n",
        "INSERT INTO GameUser (user_id, nickname, job, level) VALUES\n",
        "    ('user_01', 'Faker', '마법사', 99),\n",
        "    ('user_02', 'Chovy', '암살자', 95),\n",
        "    ('user_03', 'Gumayusi', '궁수', 88),\n",
        "    ('user_04', 'Keria', '서포터', 85),\n",
        "    ('user_05', 'Zeus', '전사', 92);\n",
        "\n",
        "-- 아이템 데이터\n",
        "INSERT INTO GameItem (item_id, item_name, power, owner_id) VALUES\n",
        "    (1001, '멸망의 지팡이', 250, 'user_01'),\n",
        "    (1002, '신속의 단검', 180, 'user_02'),\n",
        "    (1003, '거인의 갑옷', 50, 'user_05'),\n",
        "    (1004, '전설의 활', 210, 'user_03'),\n",
        "    (1005, '마나 수정', 30, 'user_04');\n",
        "\n",
        "-- 3. 데이터 조회 실습\n",
        "\n",
        "-- a. 전체 아이템 목록 조회\n",
        "SELECT * FROM GameItem;\n",
        "\n",
        "-- b. 유저 레벨 높은 순으로 정렬 (ORDER BY)\n",
        "SELECT * FROM GameUser\n",
        "ORDER BY level DESC;\n",
        "\n",
        "-- c. 공격력이 200 이상인 강력한 아이템만 조회 (WHERE)\n",
        "SELECT item_name, power, owner_id\n",
        "FROM GameItem\n",
        "WHERE power >= 200;\n",
        "```"
      ],
      "metadata": {
        "id": "fHeLIhCJTUfH"
      }
    }
  ]
}