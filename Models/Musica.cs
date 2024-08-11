using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Discografia.Models;
[Table("Musicas")]
public class Musica
{
    [Key]
    public int MusicaId { get; set; }
    [Required]
    [StringLength(100)]
    public string? Nome { get; set; }
    [Required]
    [StringLength(20)]
    public string? Duracao { get; set; }
    [Required]
    [StringLength(20)]
    public string? Genero { get; set; }
    [Required]
    public int ArtistaId { get; set; }
}