1. Add missing presence and length validations for Dealer#zip (see
   db/migrate/20141130205552_create_dealers.rb for length)
2. Add custom Dealer#zip= setter that strips out non-digit characters
   (73129-0001 should be saved as 731290001)
