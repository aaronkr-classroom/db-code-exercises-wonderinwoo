### STEP 1: 시스템 선택
- **게임 유저 관리**

### STEP 2: 요구사항 작성
1. **유저 등록:** 시스템에는 최소 2명 이상의 유저(예: Faker, Chovy)가 등록되어야 한다.
2. **고유 식별:** 각 유저는 고유한 `user_id`를 가지며, 아이템 또한 고유한 `item_id`를 가진다.
3. **아이템 소유:** 한 명의 유저는 여러 개의 아이템을 보유할 수 있다 (1:N 관계).
4. **상세 정보 기록:** 유저는 직업과 레벨 정보를 가지며, 아이템은 공격력과 획득 등급을 가진다.
5. **데이터 정렬 및 필터링:** 특정 공격력 이상의 아이템을 조회하거나, 유저를 레벨순으로 정렬할 수 있어야 한다.

### STEP 3: 데이터 설계
- **[Entities]**
  1. **GameUser** (유저 정보)
  2. **GameItem** (아이템 정보)

- **[GameUser Properties]**
  - user_id       VARCHAR(20) PRIMARY KEY (유저 아이디)
  - nickname      VARCHAR(30)             (닉네임)
  - job           VARCHAR(20)             (직업)
  - level         INT                     (레벨)

- **[GameItem Properties]**
  - item_id       INT PRIMARY KEY         (아이템 고유번호)
  - item_name     VARCHAR(50)             (아이템 이름)
  - power         INT                     (공격력)
  - owner_id      VARCHAR(20)             (소유자 ID - GameUser의 user_id 참조)

## Step4: SQL 작성

```
/*
[Entities]
- GameUser, GameItem

[GameUser Properties]
- user_id       VARCHAR(20) PRIMARY KEY
- nickname      VARCHAR(30)
- job           VARCHAR(20)
- level         INT

[GameItem Properties]
- item_id       INT PRIMARY KEY
- item_name     VARCHAR(50)
- power         INT
- owner_id      VARCHAR(20) (Foreign Key)
*/

-- 1. 테이블 생성
-- 유저 테이블
CREATE TABLE GameUser (
    user_id VARCHAR(20) PRIMARY KEY,
    nickname VARCHAR(30),
    job VARCHAR(20),
    level INT
);

-- 아이템 테이블
CREATE TABLE GameItem (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    power INT,
    owner_id VARCHAR(20),
    FOREIGN KEY (owner_id) REFERENCES GameUser(user_id)
);

-- 2. 데이터 삽입
-- 유저 데이터
INSERT INTO GameUser (user_id, nickname, job, level) VALUES
    ('user_01', 'Faker', '마법사', 99),
    ('user_02', 'Chovy', '암살자', 95),
    ('user_03', 'Gumayusi', '궁수', 88),
    ('user_04', 'Keria', '서포터', 85),
    ('user_05', 'Zeus', '전사', 92);

-- 아이템 데이터
INSERT INTO GameItem (item_id, item_name, power, owner_id) VALUES
    (1001, '멸망의 지팡이', 250, 'user_01'),
    (1002, '신속의 단검', 180, 'user_02'),
    (1003, '거인의 갑옷', 50, 'user_05'),
    (1004, '전설의 활', 210, 'user_03'),
    (1005, '마나 수정', 30, 'user_04');

-- 3. 데이터 조회 실습

-- a. 전체 아이템 목록 조회
SELECT * FROM GameItem;

-- b. 유저 레벨 높은 순으로 정렬 (ORDER BY)
SELECT * FROM GameUser 
ORDER BY level DESC;

-- c. 공격력이 200 이상인 강력한 아이템만 조회 (WHERE)
SELECT item_name, power, owner_id 
FROM GameItem 
WHERE power >= 200;
```
