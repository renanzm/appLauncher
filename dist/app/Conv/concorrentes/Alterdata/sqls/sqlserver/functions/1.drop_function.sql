IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.getNumericValue') AND type = N'FN')
    DROP FUNCTION dbo.getNumericValue