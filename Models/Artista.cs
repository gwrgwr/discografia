using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Discografia.Models;

[Table("Artistas")]
public class Artista
{
    [Key]
    public int ArtistaId { get; set; }
    [Required]
    [StringLength(100)]
    public string? Nome { get; set; }
    [Required]
    public int Idade { get; set; }
    [Required]
    public int qtdeMusica { get; set; }
    
    public ICollection<Musica>? musicasArtista { get; set; }
}