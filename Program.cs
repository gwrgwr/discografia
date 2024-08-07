using System.Text.Json.Serialization;
using Discografia.Context;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
string mySqlConnection = builder.Configuration.GetConnectionString("DefaultConnection"); 
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(mySqlConnection,
        ServerVersion.AutoDetect(mySqlConnection)));
builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
});
var app = builder.Build();

// Obtém a string de conexão com o banco de dados MySQL a partir das configurações da aplicação.



// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();