table 50100 Reward
{
    fields
    {
        field(1; "Reward No."; Code[30])
        {

        }
        field(2; Description; Text[250])
        {
            NotBlank = true;
        }
        field(3; "Discount Percentage"; Decimal)
        {
            MinValue = 0;
            MaxValue = 100;
            DecimalPlaces = 2;
        }
        field(4; "Minimum Purchase"; Decimal)
        {
            MinValue = 0;
            DecimalPlaces = 2;
        }
        field(5; "Last Modified Date"; Date)
        {
            Editable = false;
        }
    }

    
    keys
    {
        key(PK; "Reward No.")
        {
            Clustered = true;
        }


    }
    
    trigger OnInsert();
    begin
        SetLastModifiedDate();
    end;

    trigger OnModify();
    begin
        SetLastModifiedDate();
    end;

    trigger OnDelete();
    begin
        SetLastModifiedDate();
    end;

    local procedure SetLastModifiedDate();
    begin
        rec."Last Modified Date" := Today();
    end;
}
page 50101 "Reward Card"
{
    PageType = Card;
    SourceTable = Reward;
    layout
    {
        area(Content)
        {
            group(Reward)
            {
                field("Reward No."; "Reward No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                }
                field("Discount Percentage"; "Discount Percentage")
                {
                    ApplicationArea = all;
                }

            }

        }
    }
}
page 50102 "Reward List"
{
    PageType = List;
    SourceTable = Reward;
    CardPageId = "Reward Card";
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Reward No."; "Reward No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                }
                field("Discount Percentage"; "Discount Percentage")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

