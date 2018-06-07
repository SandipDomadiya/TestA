table 50101 Address
{

    Caption = 'Sample table';
    DataPerCompany = true;

    fields
    {
        field(1; Address; Text[50])
        {
            Description = 'Address Retrieved By Service';
        }
        field(2; "Locallity2"; Text[30])
        {
            Description = 'Locallity retrieved by Service';
        }
        field(3; "Town/City"; Text[30])
        {
            Description = 'Town/City retrieved by Service';
        }
        field(4; County; Text[30])
        {
            Description = 'County retrived by Service';
            trigger OnValidate();
            begin
                ValidateCounty();
            end;
        }
        field(5; SaleInvoiceOpen; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count ("Sales Header" where ("Document Type" = filter (invoice), Status = filter (open)));
        }
        field(6; CountyName; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup ("Country/Region".Name where (Code = field (County)));
        }

    }

    keys
    {
        key(PK; Address, Locallity)
        {
            Clustered = true;
        }
        key(SK; Locallity)
        {

        }
    }

    var
        Msg: TextConst ENU = 'Hello from my Method';
        RecVari: Record Address;

    trigger OnInsert();
    begin

    end;

    trigger OnDelete();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnRename();
    begin
    end;

    local procedure ValidateCounty();
    begin
        Message(Msg);
    end;

}

page 50100 "Address Card"
{
    PageType = Card;
    SourceTable = Address;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Address; Address)
                {
                    ApplicationArea = all;
                }
                field(Locallity; Locallity)
                {
                    ApplicationArea = all;
                }
                field("Town/City"; "Town/City")
                {
                    ApplicationArea = all;
                }
                field(County; County)
                {
                    ApplicationArea = all;
                }
                field(SaleInvoiceOpen; SaleInvoiceOpen)
                {
                    ApplicationArea = all;
                }
                field(CountyName; CountyName)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }

    var
        myInt: Integer;
}