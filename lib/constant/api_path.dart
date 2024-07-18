class ApiPaths {
  // static const baseURL = 'https://';
  static const baseURL = 'http://192.168.1.5:3005';

  /// HTTP request methods 
  static const String getRequest = 'get';
  static const String postRequest = 'post';
  static const String putRequest = 'put';
  static const String patchRequest = 'patch';
  static const String deleteRequest = 'delete';


  // Sub paths
  static const String loginPath = '$baseURL/login';
  static const String registerPath = '$baseURL/register';
  static const String tabletypepath = '$baseURL/tableType';
  static const String tablepath = '$baseURL/table';
  static const String update_table = '$baseURL/update-table';
  static const String productpath = '$baseURL/food';
  static const String OrderProduct = '$baseURL/product';
  static const String producttypepath = '$baseURL/product-type';
  static const String add_producttype = '$baseURL/product-types';
  static const String delete_producttype = '$baseURL/delete-product-type';
   static const String upadte_productype = '$baseURL/update-product-type';
  static const String unitpath = '$baseURL/Unit';
  static const String addUnit = '$baseURL/Unit';
  static const String delete_unit = '$baseURL/delete-Unit';
  static const String update_unit = '$baseURL/update-Unit';
  static const String uploadimagePath = '$baseURL/upload';
  static const String add_productPath = '$baseURL/add-product';
  static const String upadte_productPath = '$baseURL/update-product';
  static const String delete_productPath = '$baseURL/delete-product';
  static const String imagePath = '$baseURL/image';
    static const String order_product = '$baseURL/order';
    static const String order_detail = '$baseURL/order-details';
    static const String order_by_table = '$baseURL/order-by-table';
    static const String cut_stocks = '$baseURL/cut-stock';
    static const String update_tbOrders = '$baseURL/update-Order_payment';
    static const String getOrderby_table = '$baseURL/getOrderBytable';
    static const String update_move_table = '$baseURL/update-move-tables';
    static const String delete_getFromtable = '$baseURL/delete-move-order-getFromtable';
    static const String update_table_id = '$baseURL/update_tableID_status_tbOrder';
    static const String getOrdrereports = '$baseURL/getOrderDateRange';
    static const String income = '$baseURL/income';
    static const String incomeYear = '$baseURL/incomeyear';
    static const String SelectOrderByReport = '$baseURL/select-by-order_id';
    static const String getProduct_makeReport = '$baseURL/products';
    static const String getOrderdetail_makeReports = '$baseURL/getOrderDetailforProductReport';
    static const String getOrderByOrderStatus = '$baseURL/getOrderstatus';
    static const String getOrderDetail_kitchen = '$baseURL/getOrderDetail_Kitchen';
    static const String getOrderDetail_report = '$baseURL/getOrderDetailReport';
    static const String getUpdateTableStatus_orderStatus = '$baseURL/updateTables-orderstatus';
    static const String postOrderproduct = '$baseURL/add-OrderProduct';
    static const String updateOrderproduct = '$baseURL/update-OrderProduct';
    static const String slectorderproductForImport = '$baseURL/OrderProduct_for_improt';
    static const String updateProductImport = '$baseURL/update-product-quantity-import';
  static const String getUser = '$baseURL/getuser';
    static const String addUsers = '$baseURL/AddUser'; 
    static const String uploadUserImage = '$baseURL/uploads';
    static const String delete_user = '$baseURL/delete-user';
    static const String updateUser = '$baseURL/update-user';
    static const String menutable = '$baseURL/menutable';



  static const String defaulProfileImage =
      'https://img.freepik.com/free-icon/user_318-159711.jpg';
}
