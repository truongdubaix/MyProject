import mysql from "mysql2/promise";
const run = async () => {
    try {
        const pool = mysql.createPool({
            host: "localhost",
            user: "root",
            password: "",
            database: "speedyship"
        });
        
        await pool.query(`
            CREATE TABLE IF NOT EXISTS news (
                id INT AUTO_INCREMENT PRIMARY KEY,
                title VARCHAR(255) NOT NULL,
                \`desc\` TEXT,
                content LONGTEXT,
                image VARCHAR(500),
                author VARCHAR(100) DEFAULT 'Admin',
                comments INT DEFAULT 0,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            )
        `);
        
        console.log("Table 'news' created successfully.");
        
        // Insert sample data
        const [existing] = await pool.query("SELECT COUNT(*) as count FROM news");
        if (existing[0].count === 0) {
            await pool.query(`
                INSERT INTO news (title, \`desc\`, content, image, author, comments, created_at) VALUES 
                ('Giải pháp vận chuyển hàng hóa xuyên biên giới tối ưu 2024', 'Khám phá các phương thức vận tải đa phương thức giúp tiết kiệm chi phí và thời gian cho doanh nghiệp xuất nhập khẩu.', '<p>Nội dung chi tiết...</p>', 'https://ship-fast.monamedia.net/wp-content/uploads/2023/04/blog-s-1-2-414x273.jpg', 'Admin', 5, '2023-12-20 10:00:00'),
                ('Đừng để hàng hóa bị kẹt: Chọn đội xe tải SpeedyShip', 'Với đội xe hùng hậu và công nghệ định vị GPS real-time, chúng tôi cam kết giao hàng đúng hẹn bất chấp mọi điều kiện.', '<p>Nội dung chi tiết...</p>', 'https://ship-fast.monamedia.net/wp-content/uploads/2023/04/blog-s-1-3-414x273.jpg', 'SpeedyTeam', 12, '2023-12-18 14:30:00'),
                ('Đối tác Logistics hoàn hảo: Chìa khóa bứt phá doanh thu', 'Tìm hiểu cách một hệ thống logistics chuyên nghiệp có thể giúp bạn giảm 30% chi phí vận hành và tăng trải nghiệm khách hàng.', '<p>Nội dung chi tiết...</p>', 'https://ship-fast.monamedia.net/wp-content/uploads/2023/04/blog-s-1-4-414x273.jpg', 'Ban Biên Tập', 8, '2023-12-15 09:15:00')
            `);
            console.log("Sample news inserted.");
        }
        
        process.exit(0);
    } catch(err) {
        console.error("Error:", err);
        process.exit(1);
    }
}
run();
