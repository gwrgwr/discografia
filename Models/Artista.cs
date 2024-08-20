using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Discografia.Models;

[Table("Artistas")]
public class Artista
{
    [Key]
    public int ArtistaId { get; set; }

    [Required] [StringLength(100)] public string? Nome { get; set; }

    [Required]
    public int Idade { get; set; }
    [Required]
    public string? imgUrl { get; set; }
    [Required]
    public int qtdeMusica { get; set; }
    public ICollection<Musica>? musicasArtista { get; set; }
}