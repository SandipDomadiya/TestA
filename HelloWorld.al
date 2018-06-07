// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!



pageextension 50116 CustomerListExt2 extends "Customer card"
{
    layout
    {
        addafter(Name)
        {
           field(MyCus3;MyCus3)
           {
               ApplicationArea = All;
              
           }  
        }
    }
    actions
    {
        addafter(Statistics)
        {
            action(Address)
            {
                RunObject = page 50100;
                Image = Card;
                Promoted = true;
            }
        }
    }

    
}


tableextension 50100 CustomerTab extends Customer
{
    fields
    {
        field(50100;MyCus3;Code[50])
        {
            
        }
        // Add changes to table fields here
        
    }
    
}