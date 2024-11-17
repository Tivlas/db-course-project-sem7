using System;
using System.Collections.Generic;

namespace Shop.Models;

public partial class ReviewLog
{
    public int LogId { get; set; }

    public string Operation { get; set; } = null!;

    public int ReviewId { get; set; }

    public int ProductId { get; set; }

    public int ClientId { get; set; }

    public string Content { get; set; } = null!;

    public int Rating { get; set; }

    public DateTime Date { get; set; }

    public DateTime? ModifiedDate { get; set; }
}
