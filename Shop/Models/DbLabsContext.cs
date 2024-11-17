using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Shop.Models;

public partial class DbLabsContext : DbContext
{
    public DbLabsContext()
    {
    }

    public DbLabsContext(DbContextOptions<DbLabsContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Cart> Carts { get; set; }

    public virtual DbSet<CartItem> CartItems { get; set; }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<Discount> Discounts { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<EmployeeRole> EmployeeRoles { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderItem> OrderItems { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<ProductCategory> ProductCategories { get; set; }

    public virtual DbSet<Review> Reviews { get; set; }

    public virtual DbSet<ReviewLog> ReviewLogs { get; set; }

    public virtual DbSet<TotalDiscountPercent> TotalDiscountPercents { get; set; }

    public virtual DbSet<VwEmployeeWithRole> VwEmployeeWithRoles { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Cart>(entity =>
        {
            entity.HasKey(e => e.CartId).HasName("cart_pkey");

            entity.ToTable("cart");

            entity.HasIndex(e => e.ClientId, "cart_client_id_key").IsUnique();

            entity.HasIndex(e => e.ClientId, "idx_cart_client_id");

            entity.Property(e => e.CartId).HasColumnName("cart_id");
            entity.Property(e => e.ClientId).HasColumnName("client_id");
            entity.Property(e => e.Price)
                .HasPrecision(7, 2)
                .HasColumnName("price");

            entity.HasOne(d => d.Client).WithOne(p => p.Cart)
                .HasForeignKey<Cart>(d => d.ClientId)
                .HasConstraintName("cart_client_id_fkey");
        });

        modelBuilder.Entity<CartItem>(entity =>
        {
            entity.HasKey(e => e.CartItemId).HasName("cart_item_pkey");

            entity.ToTable("cart_item");

            entity.HasIndex(e => e.CartId, "idx_cart_item_cart_id");

            entity.HasIndex(e => e.ProductId, "idx_cart_item_product_id");

            entity.Property(e => e.CartItemId).HasColumnName("cart_item_id");
            entity.Property(e => e.CartId).HasColumnName("cart_id");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.ProductPrice)
                .HasPrecision(7, 2)
                .HasColumnName("product_price");
            entity.Property(e => e.ProductQuantity).HasColumnName("product_quantity");

            entity.HasOne(d => d.Cart).WithMany(p => p.CartItems)
                .HasForeignKey(d => d.CartId)
                .HasConstraintName("cart_item_cart_id_fkey");

            entity.HasOne(d => d.Product).WithMany(p => p.CartItems)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("cart_item_product_id_fkey");
        });

        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.ClientId).HasName("client_pkey");

            entity.ToTable("client");

            entity.HasIndex(e => e.Email, "client_email_key").IsUnique();

            entity.HasIndex(e => e.Email, "idx_client_email");

            entity.Property(e => e.ClientId).HasColumnName("client_id");
            entity.Property(e => e.Email)
                .HasMaxLength(30)
                .HasColumnName("email");
            entity.Property(e => e.FirstName)
                .HasMaxLength(30)
                .HasColumnName("first_name");
            entity.Property(e => e.LastName)
                .HasMaxLength(30)
                .HasColumnName("last_name");
            entity.Property(e => e.Password)
                .HasMaxLength(20)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(13)
                .IsFixedLength()
                .HasColumnName("phone");
        });

        modelBuilder.Entity<Discount>(entity =>
        {
            entity.HasKey(e => e.DiscountId).HasName("discount_pkey");

            entity.ToTable("discount");

            entity.HasIndex(e => e.Percent, "idx_discount_percent");

            entity.Property(e => e.DiscountId).HasColumnName("discount_id");
            entity.Property(e => e.Description)
                .HasMaxLength(50)
                .HasColumnName("description");
            entity.Property(e => e.IsActive).HasColumnName("is_active");
            entity.Property(e => e.Name)
                .HasMaxLength(30)
                .HasColumnName("name");
            entity.Property(e => e.Percent).HasColumnName("percent");
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.EmployeeId).HasName("employee_pkey");

            entity.ToTable("employee");

            entity.HasIndex(e => e.Email, "idx_employee_email");

            entity.HasIndex(e => e.EmployeeRoleId, "idx_employee_employee_role_id");

            entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            entity.Property(e => e.Email)
                .HasMaxLength(30)
                .HasColumnName("email");
            entity.Property(e => e.EmployeeRoleId).HasColumnName("employee_role_id");
            entity.Property(e => e.FirstName)
                .HasMaxLength(30)
                .HasColumnName("first_name");
            entity.Property(e => e.LastName)
                .HasMaxLength(30)
                .HasColumnName("last_name");
            entity.Property(e => e.Password)
                .HasMaxLength(20)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(13)
                .IsFixedLength()
                .HasColumnName("phone");
            entity.Property(e => e.Position)
                .HasMaxLength(30)
                .HasColumnName("position");
            entity.Property(e => e.Salary)
                .HasPrecision(7, 2)
                .HasColumnName("salary");

            entity.HasOne(d => d.EmployeeRole).WithMany(p => p.Employees)
                .HasForeignKey(d => d.EmployeeRoleId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("employee_employee_role_id_fkey");
        });

        modelBuilder.Entity<EmployeeRole>(entity =>
        {
            entity.HasKey(e => e.EmployeeRoleId).HasName("employee_role_pkey");

            entity.ToTable("employee_role");

            entity.Property(e => e.EmployeeRoleId).HasColumnName("employee_role_id");
            entity.Property(e => e.Name)
                .HasMaxLength(30)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("order_pkey");

            entity.ToTable("order");

            entity.HasIndex(e => e.ClientId, "idx_order_client_id");

            entity.HasIndex(e => e.Date, "idx_order_date");

            entity.Property(e => e.OrderId).HasColumnName("order_id");
            entity.Property(e => e.ClientId).HasColumnName("client_id");
            entity.Property(e => e.Date)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("date");
            entity.Property(e => e.Price)
                .HasPrecision(7, 2)
                .HasColumnName("price");

            entity.HasOne(d => d.Client).WithMany(p => p.Orders)
                .HasForeignKey(d => d.ClientId)
                .HasConstraintName("order_client_id_fkey");
        });

        modelBuilder.Entity<OrderItem>(entity =>
        {
            entity.HasKey(e => e.OrderItemId).HasName("order_item_pkey");

            entity.ToTable("order_item");

            entity.HasIndex(e => e.OrderId, "idx_order_item_order_id");

            entity.HasIndex(e => e.ProductId, "idx_order_item_product_id");

            entity.Property(e => e.OrderItemId).HasColumnName("order_item_id");
            entity.Property(e => e.OrderId).HasColumnName("order_id");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.ProductPrice)
                .HasPrecision(7, 2)
                .HasColumnName("product_price");
            entity.Property(e => e.ProductQuantity).HasColumnName("product_quantity");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderItems)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("order_item_order_id_fkey");

            entity.HasOne(d => d.Product).WithMany(p => p.OrderItems)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("order_item_product_id_fkey");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.ProductId).HasName("product_pkey");

            entity.ToTable("product");

            entity.HasIndex(e => e.Brand, "idx_product_brand");

            entity.HasIndex(e => e.Name, "idx_product_name");

            entity.HasIndex(e => e.ProductCategoryId, "idx_product_product_category_id");

            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.Brand)
                .HasMaxLength(30)
                .HasColumnName("brand");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Name)
                .HasMaxLength(30)
                .HasColumnName("name");
            entity.Property(e => e.Price)
                .HasPrecision(7, 2)
                .HasColumnName("price");
            entity.Property(e => e.ProductCategoryId).HasColumnName("product_category_id");
            entity.Property(e => e.ProductionDate).HasColumnName("production_date");
            entity.Property(e => e.Quantity).HasColumnName("quantity");

            entity.HasOne(d => d.ProductCategory).WithMany(p => p.Products)
                .HasForeignKey(d => d.ProductCategoryId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("product_product_category_id_fkey");

            entity.HasMany(d => d.Discounts).WithMany(p => p.Products)
                .UsingEntity<Dictionary<string, object>>(
                    "ProductDiscount",
                    r => r.HasOne<Discount>().WithMany()
                        .HasForeignKey("DiscountId")
                        .HasConstraintName("product_discount_discount_id_fkey"),
                    l => l.HasOne<Product>().WithMany()
                        .HasForeignKey("ProductId")
                        .HasConstraintName("product_discount_product_id_fkey"),
                    j =>
                    {
                        j.HasKey("ProductId", "DiscountId").HasName("product_discount_pkey");
                        j.ToTable("product_discount");
                        j.HasIndex(new[] { "DiscountId" }, "idx_product_discount_discount_id");
                        j.HasIndex(new[] { "ProductId" }, "idx_product_discount_product_id");
                        j.IndexerProperty<int>("ProductId").HasColumnName("product_id");
                        j.IndexerProperty<int>("DiscountId").HasColumnName("discount_id");
                    });
        });

        modelBuilder.Entity<ProductCategory>(entity =>
        {
            entity.HasKey(e => e.ProductCategoryId).HasName("product_category_pkey");

            entity.ToTable("product_category");

            entity.HasIndex(e => e.Name, "idx_product_category_name");

            entity.Property(e => e.ProductCategoryId).HasColumnName("product_category_id");
            entity.Property(e => e.Name)
                .HasMaxLength(30)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Review>(entity =>
        {
            entity.HasKey(e => e.ReviewId).HasName("review_pkey");

            entity.ToTable("review");

            entity.HasIndex(e => e.ClientId, "idx_review_client_id");

            entity.HasIndex(e => e.ProductId, "idx_review_product_id");

            entity.Property(e => e.ReviewId).HasColumnName("review_id");
            entity.Property(e => e.ClientId).HasColumnName("client_id");
            entity.Property(e => e.Content).HasColumnName("content");
            entity.Property(e => e.Date)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("date");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.Rating).HasColumnName("rating");

            entity.HasOne(d => d.Client).WithMany(p => p.Reviews)
                .HasForeignKey(d => d.ClientId)
                .HasConstraintName("review_client_id_fkey");

            entity.HasOne(d => d.Product).WithMany(p => p.Reviews)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("review_product_id_fkey");
        });

        modelBuilder.Entity<ReviewLog>(entity =>
        {
            entity.HasKey(e => e.LogId).HasName("review_log_pkey");

            entity.ToTable("review_log");

            entity.Property(e => e.LogId).HasColumnName("log_id");
            entity.Property(e => e.ClientId).HasColumnName("client_id");
            entity.Property(e => e.Content).HasColumnName("content");
            entity.Property(e => e.Date)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("date");
            entity.Property(e => e.ModifiedDate)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("modified_date");
            entity.Property(e => e.Operation).HasColumnName("operation");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.Rating).HasColumnName("rating");
            entity.Property(e => e.ReviewId).HasColumnName("review_id");
        });

        modelBuilder.Entity<TotalDiscountPercent>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("total_discount_percent");

            entity.Property(e => e.Coalesce).HasColumnName("coalesce");
        });

        modelBuilder.Entity<VwEmployeeWithRole>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_employee_with_role");

            entity.Property(e => e.Email)
                .HasMaxLength(30)
                .HasColumnName("email");
            entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            entity.Property(e => e.FirstName)
                .HasMaxLength(30)
                .HasColumnName("first_name");
            entity.Property(e => e.LastName)
                .HasMaxLength(30)
                .HasColumnName("last_name");
            entity.Property(e => e.Name)
                .HasMaxLength(30)
                .HasColumnName("name");
            entity.Property(e => e.Password)
                .HasMaxLength(20)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(13)
                .IsFixedLength()
                .HasColumnName("phone");
            entity.Property(e => e.Position)
                .HasMaxLength(30)
                .HasColumnName("position");
            entity.Property(e => e.Salary)
                .HasPrecision(7, 2)
                .HasColumnName("salary");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
