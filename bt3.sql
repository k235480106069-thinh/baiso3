CREATE DATABASE PawnShopDB;
GO

USE PawnShopDB;
GO
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    Phone VARCHAR(20),
    CCCD VARCHAR(20),
    Address NVARCHAR(255)
);
CREATE TABLE Contract (
    ContractID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    LoanAmount DECIMAL(18,2),
    StartDate DATE,
    Deadline1 DATE,
    Deadline2 DATE,
    Status NVARCHAR(50),
    FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
);
CREATE TABLE Asset (
    AssetID INT PRIMARY KEY IDENTITY(1,1),
    AssetName NVARCHAR(100),
    EstimatedValue DECIMAL(18,2),
    AssetStatus NVARCHAR(50)
);
CREATE TABLE ContractAsset (
    ContractID INT,
    AssetID INT,
    PRIMARY KEY (ContractID, AssetID),
    FOREIGN KEY (ContractID)
        REFERENCES Contract(ContractID),
    FOREIGN KEY (AssetID)
        REFERENCES Asset(AssetID)
);
CREATE TABLE PaymentLog (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    ContractID INT,
    PayDate DATE,
    AmountPaid DECIMAL(18,2),
    Collector NVARCHAR(100),
    FOREIGN KEY (ContractID)
        REFERENCES Contract(ContractID)
);
INSERT INTO Customer
VALUES
(N'Nguyễn Văn A', '0911111111', '123456789', N'Hà Nội'),
(N'Trần Văn B', '0922222222', '987654321', N'Thái Nguyên');
INSERT INTO Contract
VALUES
(
    1,
    10000000,
    '2026-05-01',
    '2026-05-10',
    '2026-05-20',
    N'Đang vay'
);
INSERT INTO Asset
VALUES
(N'Iphone 15', 15000000, N'Đang cầm cố'),
(N'Laptop Dell', 12000000, N'Đang cầm cố');
INSERT INTO ContractAsset
VALUES
(1,1),
(1,2);
SELECT * FROM Customer;
SELECT * FROM Contract;
SELECT * FROM Asset;
SELECT * FROM ContractAsset;
CREATE FUNCTION fn_CalcMoneyContract
(
    @ContractID INT,
    @TargetDate DATE
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE
        @Loan DECIMAL(18,2),
        @Start DATE,
        @D1 DATE,
        @Days INT,
        @LateDays INT,
        @SimpleInterest DECIMAL(18,2),
        @Total DECIMAL(18,2);
    SELECT
        @Loan = LoanAmount,
        @Start = StartDate,
        @D1 = Deadline1
    FROM Contract
    WHERE ContractID = @ContractID;
    -- chưa quá hạn
    IF @TargetDate <= @D1
    BEGIN
        SET @Days =
            DATEDIFF(DAY, @Start, @TargetDate);
        SET @SimpleInterest =
            (@Loan / 1000000.0)
            * 5000
            * @Days;
        SET @Total =
            @Loan + @SimpleInterest;
    END
    -- quá hạn
    ELSE
    BEGIN
        SET @Days =
            DATEDIFF(DAY, @Start, @D1);
        SET @SimpleInterest =
            (@Loan / 1000000.0)
            * 5000
            * @Days;
        SET @LateDays =
            DATEDIFF(DAY, @D1, @TargetDate);
        SET @Total =
            (@Loan + @SimpleInterest)
            * POWER(1.005, @LateDays);
    END
    RETURN @Total;
END;
SELECT dbo.fn_CalcMoneyContract
(
    1,
    '2026-05-08'
) AS TotalMoney;
CREATE PROCEDURE sp_PayDebt
(
    @ContractID INT,

    @Money DECIMAL(18,2),

    @Collector NVARCHAR(100)
)
AS
BEGIN
    DECLARE @CurrentDebt DECIMAL(18,2);
    SET @CurrentDebt =
        dbo.fn_CalcMoneyContract
        (
            @ContractID,
            GETDATE()
        );
    INSERT INTO PaymentLog
    VALUES
    (
        @ContractID,
        GETDATE(),
        @Money,
        @Collector
    );

    IF @Money >= @CurrentDebt
    BEGIN

        UPDATE Contract
        SET Status = N'Đã thanh toán'
        WHERE ContractID = @ContractID;

        UPDATE Asset
        SET AssetStatus = N'Đã trả khách'
        WHERE AssetID IN
        (
            SELECT AssetID
            FROM ContractAsset
            WHERE ContractID = @ContractID
        );
    END
    ELSE
    BEGIN
        UPDATE Contract
        SET Status = N'Đang trả góp'
        WHERE ContractID = @ContractID;
    END
END;
EXEC sp_PayDebt
    1,
    12000000,
    N'Nhân viên A';
SELECT * FROM PaymentLog;
SELECT * FROM Contract;
SELECT * FROM Asset;
UPDATE Contract
SET
    Status = N'Đang vay',
    Deadline1 = '2026-05-01'
WHERE ContractID = 1;
SELECT
    c.FullName,
    c.Phone,
    ct.LoanAmount,
    DATEDIFF
    (
        DAY,
        ct.Deadline1,
        GETDATE()
    ) AS OverdueDays,
    dbo.fn_CalcMoneyContract
    (
        ct.ContractID,
        GETDATE()
    ) AS CurrentDebt
FROM Customer c
JOIN Contract ct
ON c.CustomerID = ct.CustomerID
WHERE
    ct.Deadline1 < GETDATE()
    AND ct.Status <> N'Đã thanh toán';
CREATE TRIGGER trg_BadDebt
ON Contract
AFTER UPDATE
AS
BEGIN
    UPDATE Contract
    SET Status = N'Quá hạn'
    WHERE
        Deadline1 < GETDATE()
        AND Status = N'Đang vay';
END;