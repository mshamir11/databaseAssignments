echo "Creation and Insertion of Ecommerce Database"
sudo mysql < assignment.sql 
echo "Assignment.sql completed ================================= 1/13"
sudo mysql < ./Insert/insert_users.sql
echo "insert_users.sql completed =============================== 2/13"
sudo mysql < ./Insert/insert_retailers.sql
echo "insert_retailers.sql completed =========================== 3/13"
sudo mysql < ./Insert/insert_electronics_product.sql
echo "insert_electronics_product.sql completed ================= 4/13"
sudo mysql < ./Insert/insert_clothes_product.sql
echo "insert_clothes_product.sql completed ===================== 5/13"
sudo mysql < ./Insert/insert_novel_product.sql
echo "insert_novel_product.sql completed ======================= 6/13"
sudo mysql < ./Insert/insert_delivery_address.sql
echo "insert_delivery_address.sql completed ==================== 7/13"
sudo mysql < ./Insert/insert_into_orders.sql
echo "insert_into_orders.sql completed ========================= 8/13"
sudo mysql < ./Insert/insert_history.sql
echo "insert_history.sql completed ============================= 9/13"
sudo mysql < ./Insert/insert_cart.sql
echo "insert_cart.sql completed ================================ 10/13"
sudo mysql < ./Insert/insert_cloth_desc.sql
echo "insert_cloth_desc.sql completed ========================== 11/13"
sudo mysql < ./Insert/insert_electronics_desc.sql
echo "insert_electronics_desc.sql completed ==================== 12/13"
sudo mysql < ./Insert/insert_novel_desc.sql
echo "insert_novel_desc.sql completed ========================== 13/13"

