-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2026 at 10:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omnes_marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `bidder_id` int(11) NOT NULL,
  `bid_amount` decimal(10,2) NOT NULL,
  `max_amount` decimal(10,2) NOT NULL,
  `is_winner` tinyint(1) DEFAULT 0,
  `placed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `product_id`, `bidder_id`, `bid_amount`, `max_amount`, `is_winner`, `placed_at`) VALUES
(2, 32, 3, 2200.00, 2800.00, 0, '2026-04-11 14:55:36'),
(3, 37, 5, 4500.00, 5909099.00, 0, '2026-04-14 09:36:07'),
(4, 37, 5, 4501.00, 99999999.99, 0, '2026-04-14 09:36:25'),
(5, 40, 6, 5000.00, 6000.00, 0, '2026-04-14 10:12:29'),
(6, 40, 4, 5001.00, 6500.00, 0, '2026-04-14 10:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_at`) VALUES
(3, 4, 8, '2026-04-12 17:27:22'),
(4, 4, 7, '2026-04-12 20:30:28'),
(6, 6, 5, '2026-04-14 10:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `negotiations`
--

CREATE TABLE `negotiations` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `round` int(11) DEFAULT 1,
  `buyer_offer` decimal(10,2) DEFAULT NULL,
  `seller_reply` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','accepted','rejected','countered') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `negotiations`
--

INSERT INTO `negotiations` (`id`, `product_id`, `buyer_id`, `round`, `buyer_offer`, `seller_reply`, `status`, `created_at`) VALUES
(1, 33, 3, 1, 850.00, NULL, 'pending', '2026-04-12 19:31:22'),
(2, 22, 6, 1, 250.00, NULL, 'pending', '2026-04-14 10:03:09'),
(3, 22, 1, 1, 300.00, NULL, 'pending', '2026-04-14 10:05:27'),
(4, 22, 6, 2, 275.00, 278.00, 'countered', '2026-04-14 10:06:17'),
(5, 22, 6, 3, 280.00, 300.00, 'countered', '2026-04-14 10:10:30'),
(6, 22, 6, 4, 340.00, NULL, 'pending', '2026-04-14 10:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `is_read`, `link`, `created_at`) VALUES
(1, 3, 'Your bid on \"Antique Gilded Mirror\" is currently the highest!', 1, 'product.php?id=31', '2026-04-11 14:55:36'),
(2, 3, 'A new Rare item has been listed: Edo Period Japanese Screen.', 1, 'product.php?id=40', '2026-04-11 14:55:36'),
(3, 1, 'buyer_demo made an offer of €850.00 on \"Signed Ceramic Sculpture\". Round 1/5.', 1, 'seller.php?action=negotiate&product_id=33', '2026-04-12 19:31:22'),
(4, 1, 'A new bid of €4,500.00 has been placed on \"Murano Glass Chandelier\".', 1, 'product.php?id=37', '2026-04-14 09:36:07'),
(5, 1, 'A new bid of €4,501.00 has been placed on \"Murano Glass Chandelier\".', 1, 'product.php?id=37', '2026-04-14 09:36:25'),
(6, 2, 'Farouk made an offer of €250.00 on \"Abstract Oil Painting\". Round 1/5.', 1, 'seller.php?action=negotiate&product_id=22', '2026-04-14 10:03:09'),
(7, 2, 'admin made an offer of €300.00 on \"Abstract Oil Painting\". Round 1/5.', 1, 'seller.php?action=negotiate&product_id=22', '2026-04-14 10:05:27'),
(8, 2, 'Farouk made an offer of €275.00 on \"Abstract Oil Painting\". Round 2/5.', 1, 'seller.php?action=negotiate&product_id=22', '2026-04-14 10:06:17'),
(9, 6, 'The seller has countered with €278.00. Check your negotiation thread.', 1, 'product.php?id=22', '2026-04-14 10:08:52'),
(10, 2, 'Farouk made an offer of €280.00 on \"Abstract Oil Painting\". Round 3/5.', 1, 'seller.php?action=negotiate&product_id=22', '2026-04-14 10:10:30'),
(11, 6, 'The seller has countered with €300.00. Check your negotiation thread.', 1, 'product.php?id=22', '2026-04-14 10:10:48'),
(12, 2, 'Farouk made an offer of €340.00 on \"Abstract Oil Painting\". Round 4/5.', 1, 'seller.php?action=negotiate&product_id=22', '2026-04-14 10:11:13'),
(13, 1, 'A new bid of €5,000.00 has been placed on \"Edo Period Japanese Screen\".', 1, 'product.php?id=40', '2026-04-14 10:12:29'),
(14, 1, 'A new bid of €5,001.00 has been placed on \"Edo Period Japanese Screen\".', 1, 'product.php?id=40', '2026-04-14 10:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `notification_prefs`
--

CREATE TABLE `notification_prefs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `keyword` varchar(150) DEFAULT NULL,
  `category` enum('rare','high_end','regular') DEFAULT NULL,
  `max_price` decimal(10,2) DEFAULT NULL,
  `sale_type` enum('buy_now','negotiation','best_offer') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `final_price` decimal(10,2) NOT NULL,
  `purchase_type` enum('buy_now','negotiation','best_offer') NOT NULL,
  `payment_method` enum('visa','mastercard','amex','paypal') NOT NULL,
  `card_last4` varchar(4) DEFAULT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'completed',
  `ordered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `buyer_id`, `product_id`, `final_price`, `purchase_type`, `payment_method`, `card_last4`, `status`, `ordered_at`) VALUES
(1, 4, 6, 10.00, 'buy_now', 'mastercard', '3161', 'completed', '2026-04-11 15:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `defects` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` enum('rare','high_end','regular') NOT NULL,
  `sale_type` enum('buy_now','negotiation','best_offer') NOT NULL DEFAULT 'buy_now',
  `image` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `auction_start` datetime DEFAULT NULL,
  `auction_end` datetime DEFAULT NULL,
  `is_sold` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `seller_id`, `name`, `description`, `defects`, `price`, `category`, `sale_type`, `image`, `video_url`, `auction_start`, `auction_end`, `is_sold`, `created_at`) VALUES
(1, 2, 'Minimalist Ceramic Mug', 'Matte finish 350ml stoneware mug.', NULL, 12.00, 'regular', 'buy_now', 'reg_ceramic_mug.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(2, 2, 'Scented Soy Candle', 'Lavender and eucalyptus natural wax.', NULL, 18.00, 'regular', 'buy_now', 'reg_soy_candle.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(3, 2, 'Cotton Throw Blanket', 'Woven breathable cotton for sofa or bed.', NULL, 25.00, 'regular', 'buy_now', 'reg_cotton_throww.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(4, 2, 'Geometric Wall Planter', 'Modern indoor hanging pot for succulents.', NULL, 15.00, 'regular', 'buy_now', 'reg_wall_planter.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(5, 2, 'Linen Napkin Set (4pcs)', 'Eco-friendly soft linen table linens.', NULL, 22.00, 'regular', 'buy_now', 'reg_linen_napkinss.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(6, 2, 'Cork Coaster Set', 'Set of 6 moisture-absorbent natural cork coasters.', NULL, 10.00, 'regular', 'buy_now', 'reg_cork_coasterss.jpg', NULL, NULL, NULL, 1, '2026-04-11 14:55:36'),
(7, 2, 'Glass Bud Vase', 'Clear cylindrical vase for single stems.', NULL, 14.00, 'regular', 'buy_now', 'reg_bud_vasee.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(8, 2, 'Bamboo Picture Frame', 'Sustainable wood frame for 10x15cm photos.', NULL, 19.00, 'regular', 'buy_now', 'reg_bamboo_frame.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(9, 2, 'Macrame Wall Hanging', 'Hand-knotted cotton rope bohemian decor.', NULL, 28.00, 'regular', 'buy_now', 'reg_macrame_hanging.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(10, 2, 'Woven Seagrass Basket', 'Foldable storage basket for plants.', NULL, 24.00, 'regular', 'buy_now', 'reg_seagrass_basket.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(11, 2, 'Desktop Terrarium', 'Teardrop glass container for moss and ferns.', NULL, 20.00, 'regular', 'buy_now', 'reg_desktop_terrarium.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(12, 2, 'Decorative Bookends', 'Heavy marble-finish L-shaped supports.', NULL, 30.00, 'regular', 'buy_now', 'reg_marble_bookendss.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(13, 2, 'Microfiber Area Rug', 'Soft non-slip mat for entryways.', NULL, 35.00, 'regular', 'buy_now', 'reg_microfiber_rugg.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(14, 2, 'Metal Wire Fruit Bowl', 'Black powder-coated kitchen centerpiece.', NULL, 16.00, 'regular', 'buy_now', 'reg_wire_fruit_bowll.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(15, 2, 'Incense Holder Tray', 'Ceramic leaf-shaped tray.', NULL, 12.00, 'regular', 'buy_now', 'reg_incense_tray.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(16, 2, 'Hand-Blown Glass Vase', 'Artisanal centerpiece with unique swirls.', NULL, 120.00, 'high_end', 'buy_now', 'hi_blown_glass_vase.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(17, 2, 'Solid Oak Side Table', 'Mid-century modern bedside or lounge table.', NULL, 280.00, 'high_end', 'negotiation', 'hi_oak_side_table.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(18, 2, 'Alpaca Wool Throw', 'Ultra-soft sustainable wool from Peru.', NULL, 150.00, 'high_end', 'buy_now', 'hi_alpaca_wool_throw.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(19, 2, 'Smart Ambient Lamp', 'Dimmable LED with app control.', NULL, 195.00, 'high_end', 'buy_now', 'hi_smart_ambient_lampp.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(20, 2, 'Velvet Accent Chair', 'Plush seating with gold-finished legs.', NULL, 450.00, 'high_end', 'negotiation', 'hi_velvet_accent_chair.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(21, 2, 'Marble Dining Centerpiece', 'Large Carrara marble decorative bowl.', NULL, 110.00, 'high_end', 'buy_now', 'hi_marble_centerpiece.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(22, 2, 'Abstract Oil Painting', 'Original canvas with textured brushwork.', NULL, 320.00, 'high_end', 'negotiation', 'hi_abstract_oil_painting.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(23, 2, 'Cast Iron Wall Clock', 'Industrial design with silent movement.', NULL, 145.00, 'high_end', 'buy_now', 'hi_cast_iron_clockk.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(24, 2, 'Leather Desk Mat', 'Full-grain tan leather workspace accessory.', NULL, 85.00, 'high_end', 'buy_now', 'hi_leather_desk_matt.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(25, 2, 'Sculptural Floor Mirror', 'Full-length arched mirror with brass frame.', NULL, 380.00, 'high_end', 'negotiation', 'hi_floor_mirrorr.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(26, 2, 'Ceramic Dinnerware Set', '16-piece handcrafted stoneware service.', NULL, 210.00, 'high_end', 'buy_now', 'hi_dinnerware_sett.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(27, 2, 'Crystal Decanter Set', 'Lead-free crystal bottle with 4 tumblers.', NULL, 165.00, 'high_end', 'buy_now', 'hi_crystal_decanterr.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(28, 2, 'Indoor Olive Tree', '150cm tall tree in a premium terracotta pot.', NULL, 130.00, 'high_end', 'buy_now', 'hi_indoor_olive_tre.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(29, 2, 'Cashmere Pillow Set', 'Pair of knitted Mongolian cashmere covers.', NULL, 140.00, 'high_end', 'buy_now', 'hi_cashmere_pillow.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(30, 2, 'Floating Wall Shelf', 'Minimalist walnut wood with hidden brackets.', NULL, 95.00, 'high_end', 'buy_now', 'hi_walnut_wall_shelf.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(32, 1, 'Hand-Knotted Silk Rug', 'Persian design with 1,000 knots per inch.', NULL, 2500.00, 'rare', 'best_offer', 'rare_silk_rugg.jpg', NULL, '2026-04-10 09:00:00', '2026-04-20 18:00:00', 0, '2026-04-11 14:55:36'),
(33, 1, 'Signed Ceramic Sculpture', 'Limited edition piece from a renowned artist.', NULL, 850.00, 'rare', 'negotiation', 'rare_signed_sculpturee.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(34, 1, 'Fossilized Wood Coffee Table', 'Petrified wood slab top.', NULL, 3200.00, 'rare', 'best_offer', 'rare_fossil_wood_table.jpg', NULL, '2026-04-11 10:00:00', '2026-04-18 20:00:00', 0, '2026-04-11 14:55:36'),
(35, 1, 'Vintage Bauhaus Desk Lamp', 'Original 1930s fixture in mint condition.', NULL, 950.00, 'rare', 'negotiation', 'rare_bauhaus_lamp.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(36, 1, 'Reclaimed Monastery Door', 'Hand-carved 18th-century oak entry piece.', NULL, 1800.00, 'rare', 'best_offer', 'rare_monastery_door.jpg', NULL, '2026-04-12 09:00:00', '2026-04-19 18:00:00', 0, '2026-04-11 14:55:36'),
(37, 1, 'Murano Glass Chandelier', 'Multicolored hand-blown Venetian glass.', NULL, 4500.00, 'rare', 'best_offer', 'rare_murano_chandelier.jpg', NULL, '2026-04-10 09:00:00', '2026-04-21 22:00:00', 0, '2026-04-11 14:55:36'),
(38, 1, 'Meteorite Fragment Display', 'Certified fragment on a custom stand.', NULL, 1100.00, 'rare', 'best_offer', 'rare_meteorite_displayy.jpg', NULL, '2026-04-13 10:00:00', '2026-04-20 18:00:00', 0, '2026-04-11 14:55:36'),
(39, 1, 'First Edition Architecture Folio', 'Leather-bound rare book.', NULL, 750.00, 'rare', 'negotiation', 'rare_architecture_folio.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(40, 1, 'Edo Period Japanese Screen', 'Hand-painted 4-panel divider with gold leaf.', NULL, 5000.00, 'rare', 'best_offer', 'rare_japanese_screen.jpg', NULL, '2026-04-10 09:00:00', '2026-04-14 12:16:00', 0, '2026-04-11 14:55:36'),
(41, 1, 'Limited Bronze Figurine', 'Numbered 1 of 50 cast bronze sculpture.', NULL, 1400.00, 'rare', 'best_offer', 'rare_bronze_figurinee.jpg', NULL, '2026-04-14 10:00:00', '2026-04-21 18:00:00', 0, '2026-04-11 14:55:36'),
(42, 1, 'Antique Nautical Astrolabe', 'Brass maritime instrument from the 1700s.', NULL, 2100.00, 'rare', 'best_offer', 'rare_nautical_astrolabee.jpg', NULL, '2026-04-10 09:00:00', '2026-04-17 20:00:00', 0, '2026-04-11 14:55:36'),
(43, 1, 'Hand-Woven Tapestry', 'Large-scale medieval style wall art.', NULL, 3800.00, 'rare', 'negotiation', 'rare_medieval_tapestryy.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(44, 1, 'Petrified Coral Specimen', 'Large, legally sourced deep-sea centerpiece.', NULL, 600.00, 'rare', 'negotiation', 'rare_petrified_corall.jpg', NULL, NULL, NULL, 0, '2026-04-11 14:55:36'),
(45, 1, 'Victorian Wrought Iron Gate', 'Intricate salvaged gate from a historic estate.', NULL, 1600.00, 'rare', 'best_offer', 'rare_victorian_gate.jpg', NULL, '2026-04-15 10:00:00', '2026-04-22 18:00:00', 0, '2026-04-11 14:55:36'),
(46, 1, 'Antique Gilded Mirror (19th C.)', 'Authentic French restoration with gold leaf.', '', 1199.99, 'rare', 'best_offer', 'rare_antique_gilded_mirror.jpg', NULL, '2026-04-10 12:05:00', '2026-04-16 21:05:00', 0, '2026-04-11 19:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','seller','buyer') NOT NULL DEFAULT 'buyer',
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address_line1` varchar(150) DEFAULT NULL,
  `address_line2` varchar(150) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `role`, `first_name`, `last_name`, `phone`, `address_line1`, `address_line2`, `city`, `postal_code`, `country`, `profile_photo`, `created_at`) VALUES
(1, 'admin', 'admin@omnesmp.com', '$2y$10$imSsLWZ9WvgUjqGK.jynNuGrAjQYcHtg2N3JVNerOowgMztEMIw3u', 'admin', 'Admin', 'Omnes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11 14:55:36'),
(2, 'seller_demo', 'seller@omnesmp.com', '$2y$10$WpTVXxAZ7durhMRAdDq7z.ZNE259AcQtZGm4004yeUmQY7wnqN2YK', 'seller', 'Sophie', 'Martin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11 14:55:36'),
(3, 'buyer_demo', 'buyer@omnesmp.com', '$2y$10$ddRM35jPqHn0LKl948b4SuEANcdm.aHHL267V7sR4o8CO64Imr/Ou', 'buyer', 'Lucas', 'Bernard', '+33 6 12 34 56 78', '12 Rue de Rivoli', NULL, 'Paris', '75001', 'France', NULL, '2026-04-11 14:55:36'),
(4, 'Oumar', 'faroukaminu98@gmail.com', '$2y$10$I5scAZDEexJjSGuOpFgQQOGCBtpEIzOjwdqtbk32CmgWkfUtbne3W', 'buyer', 'Oumar', 'Amin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-11 15:13:05'),
(5, 'moeez_766', 'moeezsajid@gmail.com', '$2y$10$H16OW02EaNmSUSFUECahROx8F5VB6BdW3NiDnXZHfK9dH6gbu51Qa', 'buyer', 'moeez', 'virk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-14 09:35:53'),
(6, 'Farouk', 'faroukabdullahi98@gmail.com', '$2y$10$hAm5w/Vxl5uB7xonTThu0OK9NJwhtFANxlJ1EG2R8RTV2eovbyA7K', 'buyer', 'Oumar', 'Farouk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-14 10:01:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `bidder_id` (`bidder_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `negotiations`
--
ALTER TABLE `negotiations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification_prefs`
--
ALTER TABLE `notification_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `negotiations`
--
ALTER TABLE `negotiations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification_prefs`
--
ALTER TABLE `notification_prefs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`bidder_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `negotiations`
--
ALTER TABLE `negotiations`
  ADD CONSTRAINT `negotiations_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `negotiations_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_prefs`
--
ALTER TABLE `notification_prefs`
  ADD CONSTRAINT `notification_prefs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
