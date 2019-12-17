using System.Configuration;

namespace ShopTree.Common
{
    public static class Constants
    {
        public enum HOT_LEVEL
        {
            NOT_INTEREST = 1,
            NORMAL = 2,
            INTERST = 3,
            HOT = 4,
            VERY_HOT = 5
        };

        public enum ORDER_STATUS
        {
            WAITING = 1,
            DELIVERING = 2,
            DELIVERED = 3,
            CANCEL = 4
        };

        public const int MIN_LENGTH_PASSWORD = 6;

        #region Error
        public const string ERR_REQUIRED_NAME = "Tên không được để trống";

        public const string ERR_REQUIRED_FILE = "Vui lòng chọn file";

        public const string ERR_REQUIRED_USERNAME = "Tài khoản không được để trống";

        public const string ERR_REQUIRED_PASSWORD = "Mật khẩu không được trống";

        public const string ERR_REQUIRED_EMAIL = "Email không được để trống";

        public const string ERR_REQUIRED_TITLE = "Tiêu đề không được trống";

        public const string ERR_REQUIRED_DESCRIPTION = "Mô tả không được trống";

        public const string ERR_REQUIRED_PRICE = "Giá không được trống";

        public const string ERR_REQUIRED_STOCKQUANTITY = "Số lượng không được trống";

        public const string ERR_REQUIRED_VIEWS = "Lượt xem không được trống";

        public const string ERR_REQUIRED_PRIORITY = "Độ ưu tiên không được trống";

        public const string ERR_REQUIRED_SUNNYHOUR = "Số giờ nắng không được trống";

        public const string ERR_REQUIRED_WATER = "Lượng nước không được trống";

        public const string ERR_REQUIRED_FERTILIZER = "Lượng phân không được trống";

        public const string ERR_REQUIRED_TEMPERATURE = "Nhiệt độ không được trống";

        public const string ERR_MIN_LENGTH_PASSWORD = "Mật khẩu dài hơn 6 ký tự";

        public const string ERR_MIN_PROPERTY = "Giá trị nhập vào lớn hơn {0} đơn vị";

        public const string ERR_VALUE_DISCOUNT = "Tỉ lệ giảm giá lớn hơn 0 hoặc nhỏ hơn 100";

        public const string ERR_WRONG_CREDENTIAL = "Sai tên tài khoản hoặc mật khẩu, vui lòng thử lại!";

        public const string ERR_LOCK_CREDENTIAL = "Tài khoản của bạn đang bị khoá!";

        public const string ERR_INVALID_EMAIL = "Email không hợp lệ";
        #endregion Error

        public static string EmailAccount = ConfigurationManager.AppSettings["EmailAccount"];

        public static string EmailPassword = ConfigurationManager.AppSettings["EmailPassword"];

        #region Role
        public const string ROLE_ADMIN = "Admin";

        public const string ROLE_EMPLOYEE = "Employee";

        public const string ROLE_SHIPPER = "Shipper";
        #endregion Role

        public const int PAGE_SIZE_ADMIN = 5;

        public const int PAGE_SIZE_CLIENT = 12;

        #region Path
        public const string CATEGORY_ICON_PATH = "~/Assets/client/images/icon/";

        public const string BLOG_IMAGE_PATH = "~/Assets/client/images/blog/";

        public const string PRODUCT_IMAGE_PATH = "~/Assets/client/images/product/";

        public const string ADMIN_HOMEPAGE_PATH = "admin/trang-chu";

        public const string ADMIN_LOGIN_PATH = "admin/dang-nhap";

        public const string ADMIN_LOGOUT_PATH = "admin/dang-xuat";

        public const string ADMIN_LIST_PRODUCT_PATH = "admin/san-pham/danh-sach";

        public const string ADMIN_CREATE_PRODUCT_PATH = "admin/san-pham/tao-moi";

        public const string ADMIN_DETAIL_PRODUCT_PATH = "admin/san-pham/chi-tiet/{id}";

        public const string ADMIN_EDIT_PRODUCT_PATH = "admin/san-pham/chinh-sua/{id}";

        public const string ADMIN_DELETED_PRODUCT_PATH = "admin/san-pham/da-xoa";

        public const string ADMIN_ACTIVE_PRODUCT_PATH = "admin/san-pham/active/{id}";

        public const string ADMIN_LIST_CATEGORY_PATH = "admin/danh-muc/danh-sach";

        public const string ADMIN_CREATE_CATEGORY_PATH = "admin/danh-muc/tao-moi";

        public const string ADMIN_DETAIL_CATEGORY_PATH = "admin/danh-muc/chi-tiet/{id}";

        public const string ADMIN_EDIT_CATEGORY_PATH = "admin/danh-muc/chinh-sua/{id}";

        public const string ADMIN_LIST_BLOG_PATH = "admin/blog/danh-sach";

        public const string ADMIN_CREATE_BLOG_PATH = "admin/blog/tao-moi";

        public const string ADMIN_LIST_ORDER_PATH = "admin/don-hang/danh-sach";

        public const string ADMIN_PROCESS_ORDER_PATH = "admin/don-hang/xu-ly-don-hang";

        public const string ADMIN_DELIVERING_ORDER_PATH = "admin/don-hang/don-hang-can-giao";

        public const string ADMIN_PROCESS_DELIVERY_ORDER_PATH = "admin/don-hang/giao-hang";

        public const string ADMIN_ORDER_DETAIL_PATH = "admin/don-hang/chi-tiet";

        public const string ADMIN_PROCESSED_ORDER_PATH = "admin/don-hang/da-xu-ly";

        public const string ADMIN_OUTSTANDING_ORDER_PATH = "admin/don-hang/chua-xu-ly";
        #endregion Path

        #region Advice
        public const string ADVICE_FOR_ENOUGH_SUNNYHOUR = "Số giờ nắng vừa đủ, nên tiếp tục duy trì.";

        public const string ADVICE_FOR_MUCH_SUNNYHOUR = "Số giờ nắng hơi nhiều, nên hạn chế phơi nắng.";

        public const string ADVICE_FOR_LESS_SUNNYHOUR = "Số giờ nắng hơi ít, nên tăng cường phơi nắng.";

        public const string ADVICE_FOR_ENOUGH_WATER = "Lượng nước tưới vừa đủ, nên tiếp tục duy trì.";

        public const string ADVICE_FOR_MUCH_WATER = "Lượng nước tưới hơi nhiều, nên hạn chế tưới nước, tránh làm úng cây.";

        public const string ADVICE_FOR_LESS_WATER = "Lượng nước tưới hơi ít, nên tăng cường tưới nước, tránh làm héo cây.";

        public const string ADVICE_FOR_ENOUGH_FERTILIZER = "Lượng phân bón vừa đủ, nên tiếp tục duy trì.";

        public const string ADVICE_FOR_MUCH_FERTILIZER = "Lượng phân bón hơi nhiều, nên hạn chế bón phân.";

        public const string ADVICE_FOR_LESS_FERTILIZER = "Lượng phân bón hơi ít, nên tăng cường bón phân.";

        public const string ADVICE_FOR_ENOUGH_TEMPERATURE = "Nhiệt độ vừa đủ, nên tiếp tục duy trì.";

        public const string ADVICE_FOR_HIGH_TEMPERATURE = "Nhiệt độ hơi cao, nên hạ thấp nhiệt độ.";

        public const string ADVICE_FOR_LOW_TEMPERATURE = "Nhiệt độ hơi thấp, nên tăng nhiệt độ.";
        #endregion Advice
    }
}