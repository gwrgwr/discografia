using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Discografia.Migrations
{
    /// <inheritdoc />
    public partial class ModelModified : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Genero",
                table: "Musicas",
                type: "varchar(20)",
                maxLength: 20,
                nullable: false,
                defaultValue: "")
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "imgUrl",
                table: "Artistas",
                type: "longtext",
                nullable: false)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Genero",
                table: "Musicas");

            migrationBuilder.DropColumn(
                name: "imgUrl",
                table: "Artistas");
        }
    }
}
